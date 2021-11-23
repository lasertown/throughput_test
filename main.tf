module "rg0" {
  source = "./modules/resource_group"
  rg = "throughput_test"
}
  
module "network0" {
  source = "./modules/network"
  rg = module.rg0.rg
  region = "westus2"
  address_space = [ "10.0.0.0/16" ]
  address_prefixes = [ "10.0.0.0/24" ]
}

module "storage_account0" {
  source = "./modules/storage_account"
  rg = module.rg0.rg
  region = module.network0.region
}
  
module "NSG0" {
  source = "./modules/NSG"
  rg = module.rg0.rg
  region = module.network0.region
  subnet = module.network0.subnet
}
      
module "node0" {
  source = "./modules/node"
  rg = module.rg0.rg
  region = module.network0.region
  subnet = module.network0.subnet
  NSGid = module.NSG0.NSGid
  console = module.storage_account0.console
  size = "Standard_E80ids_v4"
  publisher = "SUSE"    
  offer = "sles-15-sp3"
  sku = "gen2"
  _version = "latest"
  tag = "node0"
}

module "data_disk_group0" {
  source = "./modules/data_disk_group"
  rg = module.rg0.rg
  region = module.network0.region
  disk_type = "Premium_LRS"
  sizeGB = 1000
  vmID = module.node0.id
  caching = "None"
}
