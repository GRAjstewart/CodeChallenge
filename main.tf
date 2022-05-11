resource "random_pet" "rg-name" {
  prefix    = var.resource_group_name_prefix
}

resource "azurerm_resource_group" "rg" {
  name      = random_pet.rg-name.id
  location  = var.resource_group_location
}

# Create (and display) an SSH key
resource "tls_private_key" "public_key_openssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

module "network" {
 source = "./modules/azure_network"
 rg_name = azurerm_resource_group.rg.name 
 rg_location = var.resource_group_location
 network_cidr = var.network_cidr
}

module "linux_vm" {
source = "./modules/azure_vm"
rg_name = azurerm_resource_group.rg.name 
rg_location = var.resource_group_location
nic = [module.network.nic]
public_key_openssh = tls_private_key.public_key_openssh.public_key_openssh
}

module "cosmos_db" {
    source = "./modules/azure_cosmos_db"
    rg_name = azurerm_resource_group.rg.name 
    rg_location = var.resource_group_location
    db_type = var.db_type
    subnet_id = module.network.subnet_id

}