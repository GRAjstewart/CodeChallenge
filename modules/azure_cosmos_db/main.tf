resource "random_integer" "ri" {
  min = 10000
  max = 99999
}

resource "azurerm_cosmosdb_account" "acc" {

  name                      = "mycosmosacc-${random_integer.ri.result}"
  location                  = var.rg_location
  resource_group_name       = var.rg_name
  offer_type                = "Standard"
  kind                      = var.db_type
  enable_automatic_failover = false

  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = var.failover_location
    failover_priority = 1
  }

  geo_location {
    location          = var.rg_location
    failover_priority = 0
  }
  virtual_network_rule {
    id                = var.subnet_id
    ignore_missing_vnet_service_endpoint = true

  }
}