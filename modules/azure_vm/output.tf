output "public_ip_address" {
  value = azurerm_linux_virtual_machine.myterraformvm.public_ip_address
}
output "id" {
  value = azurerm_linux_virtual_machine.myterraformvm.id
}