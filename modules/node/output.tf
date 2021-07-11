output "public_ip" {
  value = azurerm_public_ip.ip.ip_address
}

output "id" {
  value = azurerm_linux_virtual_machine.node.id
}

output "node_name" {
  value = azurerm_linux_virtual_machine.node.name
}
