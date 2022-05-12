variable "resource_group_name_prefix" {
  default       = "rg"
  description   = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "resource_group_location" {
  default       = "centralus"
  description   = "Location of the resource group."
}
variable "db_type" {
  default = "MongoDB"
}
variable "network_cidr" {
  default = "10.0.1.0/24"
}
variable "subscription_id" {
  description = "Azure subscription ID"
}

variable "client_id" {
  description = "Azure Service Principal id (client id)"
}

variable "client_secret" {
  description = "Azure client Service Principal secret (client secret)"
}

variable "tenant_id" {
  description = "Azure tenant or directory id"
}