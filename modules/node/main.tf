provider "azurerm" {
  features {}
}

# Create public IPs
resource "azurerm_public_ip" "ip" {
    name                         = var.tag
    location                     = var.region
    resource_group_name          = var.rg
    allocation_method            = "Dynamic"
}

# Create network interface
resource "azurerm_network_interface" "nic" {
    name                      = var.tag
    location                  = var.region
    resource_group_name       = var.rg

    ip_configuration {
        name                          = "node-public"
        subnet_id                     = var.subnet
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = azurerm_public_ip.ip.id
        primary                       = "true"
    }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "isga" {
    network_interface_id      = azurerm_network_interface.nic.id
    network_security_group_id = var.NSGid
}

# Create virtual machine
resource "azurerm_linux_virtual_machine" "node" {
    name                  = var.tag
    location              = var.region
    resource_group_name   = var.rg
    network_interface_ids = [azurerm_network_interface.nic.id]
    size                  = var.size

    os_disk {
        name              =  var.tag
        caching           = "ReadWrite"
        storage_account_type = "StandardSSD_LRS"
        #disk_size_gb      = "128"
    }

    source_image_reference {
        publisher = var.publisher
        offer     = var.offer
        sku       = var.sku
        version   = var._version
    }

    computer_name  = var.tag
    admin_username = "azadmin"
    #custom_data    = file("<path/to/file>")

    admin_ssh_key {
        username       = "azadmin"
        public_key     = file("~/.ssh/id_rsa.pub")
    }
  
    boot_diagnostics {
        storage_account_uri = var.console
    }
  
    tags = {
    group = var.tag
    }
}

data "azurerm_subscription" "current" {}

resource "azurerm_dashboard" "dashboard" {
  name                = "Throughput"
  resource_group_name = var.rg
  location            = var.region
  dashboard_properties = <<DASH
  {
    "lenses": {
      "0": {
        "order": 0,
        "parts": {
          "0": {
            "position": {
              "x": 0,
              "y": 0,
              "colSpan": 6,
              "rowSpan": 4
            },
            "metadata": {
              "inputs": [
                {
                  "name": "options",
                  "value": {
                    "chart": {
                      "metrics": [
                        {
                          "resourceMetadata": {
                            "id": "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${var.rg}/providers/Microsoft.Compute/virtualMachines/${var.tag}"
                          },
                          "name": "Data Disk Read Bytes/sec",
                          "aggregationType": 4,
                          "namespace": "microsoft.compute/virtualmachines",
                          "metricVisualization": {
                            "displayName": "Data Disk Read Bytes/Sec"
                          }
                        }
                      ],
                      "title": "Avg Data Disk Read Bytes/Sec by LUN",
                      "titleKind": 1,
                      "visualization": {
                        "chartType": 2,
                        "legendVisualization": {
                          "isVisible": true,
                          "position": 2,
                          "hideSubtitle": false
                        },
                        "axisVisualization": {
                          "x": {
                            "isVisible": true,
                            "axisType": 2
                          },
                          "y": {
                            "isVisible": true,
                            "axisType": 1
                          }
                        }
                      },
                      "grouping": {
                        "dimension": "LUN",
                        "sort": 2,
                        "top": 10
                      },
                      "timespan": {
                        "relative": {
                          "duration": 43200000
                        },
                        "showUTCTime": false,
                        "grain": 2
                      }
                    }
                  },
                  "isOptional": true
                },
                {
                  "name": "sharedTimeRange",
                  "isOptional": true
                }
              ],
              "type": "Extension/HubsExtension/PartType/MonitorChartPart"
            }
          }
        }
      }
    },
    "metadata": {
      "model": {
        "timeRange": {
          "value": {
            "relative": {
              "duration": 24,
              "timeUnit": 1
            }
          },
          "type": "MsPortalFx.Composition.Configuration.ValueTypes.TimeRange"
        },
        "filterLocale": {
          "value": "en-us"
        },
        "filters": {
          "value": {
            "MsPortalFx_TimeRange": {
              "model": {
                "format": "utc",
                "granularity": "auto",
                "relative": "24h"
              },
              "displayCache": {
                "name": "UTC Time",
                "value": "Past 24 hours"
              },
              "filteredPartIds": []
            }
          }
        }
      }
    }
}
DASH
}

