output "connection_strings" {
  value = azurerm_cosmosdb_account.acc.connection_strings
  
}

output "primary_key" {
  value = azurerm_cosmosdb_account.acc.primary_key
}

output "secondary_key" {
  value = azurerm_cosmosdb_account.acc.secondary_key
}
