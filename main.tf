
# Create (and display) an SSH key
resource "tls_private_key" "public_key_openssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

module "network" {
 source = "./modules/azure_network"
 rg_name = var.resource_group_name
 rg_location = var.resource_group_location
 network_cidr = var.network_cidr
}

module "linux_vm" {
source = "./modules/azure_vm"
rg_name = var.resource_group_name
rg_location = var.resource_group_location
nic = [module.network.nic]
public_key_openssh = tls_private_key.public_key_openssh.public_key_openssh
}

module "cosmos_db" {
    source = "./modules/azure_cosmos_db"
    rg_name = var.resource_group_name
    rg_location = var.resource_group_location
    db_type = var.db_type
    subnet_id = module.network.subnet_id

}

resource "azurerm_virtual_machine_extension" "vmext" {
   
    name                    = "${module.linux_vm.id}-vmext"

    virtual_machine_id = "${module.linux_vm.id}"
    publisher            = "Microsoft.Azure.Extensions"
    type                 = "CustomScript"
    type_handler_version = "2.0"

    protected_settings = <<PROT
    {
        "script": "${base64encode(file("./scripts/vm_setup.sh"))}"
    }
    PROT
}