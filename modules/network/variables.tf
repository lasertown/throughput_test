variable "rg" {
  description = "The Resource Group name for all resources in this module"
}

variable "region" {
  description = "The Azure location where all resources in this example should be created"
}

variable "address_space" {
  description = "The address space of the VNET"
}

variable "address_prefixes" {
  description = "The address space of the subnet(s)"
}