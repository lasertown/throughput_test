output "public_ip" {
  value = azurerm_public_ip.ip.ip_address
}

output "id" {
  value = azurerm_linux_virtual_machine.id
}
