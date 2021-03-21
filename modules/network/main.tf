provider "azurerm" {
  features {}
}

resource "azurerm_virtual_network" "network" {
  name                = var.region
  resource_group_name = var.rg
  location            = var.region
  address_space       = var.address_space
}

resource "azurerm_subnet" "subnet" {
  name                 =  var.region
  virtual_network_name =  var.region
  resource_group_name  =  var.rg
  address_prefixes     =  var.address_prefixes
  depends_on = [ azurerm_virtual_network.network ]
}
