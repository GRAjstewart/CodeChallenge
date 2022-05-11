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