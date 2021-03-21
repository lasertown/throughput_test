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
