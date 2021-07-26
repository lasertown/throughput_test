output "rg" {
  value = module.rg0.rg
}
  
output "node_public_ip" {
  value = module.node0.public_ip
}
output "node_name" {
  value = module.node0.node_name
}

output "vm_ids" {
  value = module.node[*].id
}
