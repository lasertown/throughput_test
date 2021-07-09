variable "rg" {
  description = "The Resource Group name for all resources in this module"
}

variable "region" {
  description = "The Azure location where all resources in this example should be created"
}

variable "disk_type" {
  description = "Possible values are Standard_LRS, Premium_LRS, StandardSSD_LRS or UltraSSD_LRS"
}

variable "sizeGB" {
  description = "Size of disk in GB"
}

variable "vmID" {
  description = "ID of VM to attach disks to"
}

variable "caching" {
  description = "Possible values include None, ReadOnly and ReadWrite"
}
