output "nic" {
    value = azurerm_network_interface.myterraformnic.id
}
output "subnet_id" {
  value = azurerm_subnet.subnet.id
}