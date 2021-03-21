provider "azurerm" {
  features {}
}

resource "random_id" "randomId" {
    keepers = {
        # Generate a new ID only when a new resource group is defined
        resource_group = var.rg
    }
    byte_length = 4
}

resource "azurerm_storage_account" "serialConsole" {
    name                        = "serialconsole${random_id.randomId.hex}"
    resource_group_name         = var.rg
    location                    = var.region
    account_replication_type    = "LRS"
    account_tier                = "Standard"
}
