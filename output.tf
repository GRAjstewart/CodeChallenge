output "tls_private_key" {
  value     = tls_private_key.public_key_openssh.private_key_pem
  sensitive = true
}
output "public_ip_address" {
  value = module.linux_vm.public_ip_address
  sensitive = false
}
output "cosmos_connection_string" {
  value = module.cosmos_db.connection_strings
  sensitive = true
}

output "cosmos_primary_key" {
  value = module.cosmos_db.primary_key
  sensitive = true
}

output "cosmos_secondary_key" {
  value = module.cosmos_db.secondary_key
  sensitive = true
}
