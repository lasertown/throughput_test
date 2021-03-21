  
provider "azurerm" {
  features {}
}

# Create NSG
resource "azurerm_network_security_group" "ssh" {
    name                = var.region
    location            = var.region
    resource_group_name = var.rg
}

# Create NSG rule
resource "azurerm_network_security_rule" "ssh" {
  name                       = "SSH"
  priority                   = 101
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "22"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
  resource_group_name        = var.rg
  network_security_group_name = azurerm_network_security_group.ssh.name
}

resource "azurerm_subnet_network_security_group_association" "nsga" {
  subnet_id                 = var.subnet
  network_security_group_id = azurerm_network_security_group.ssh.id
}
