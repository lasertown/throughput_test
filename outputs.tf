output "rg" {
  value = module.rg0.rg
}
  
output "node_public_ips" {
  value = module.node[*].public_ip
}
output "node_names" {
  value = module.node[*].node_name
}

output "vm_ids" {
  value = module.node[*].id
}
