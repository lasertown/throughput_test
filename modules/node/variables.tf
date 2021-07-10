variable "rg" {
  description = "The Resource Group name for all resources in this module"
}

variable "region" {
  description = "The Azure location where all resources in this example should be created"
}

variable "subnet" {
  description = "The subnet for all resources in this module"
}

variable "size" {
  description = "The instance size"
}

variable "NSGid" {
  description = "The NSG id for the NIC" 
}

variable "console" {
  description = "The address of the storage account for the serial console" 
}
################################
# publisher = "SUSE"
# offer     = "sles-sap-15-sp2"
# sku       = "gen2"
# _version   = "latest"
################################
# publisher = "SUSE"
# offer     = "sles-sap-12-sp5"
# sku       = "gen2"
# _version   = "latest"
################################
# publisher = "Canonical"
# offer     = "UbuntuServer"
# sku       = "18.04-LTS"
# _version   = "latest"
################################
# publisher = "Canonical"
# offer     = "UbuntuServer"
# sku       = "16_04-lts-gen2"
# _version   = "latest"
################################
variable "publisher" {
  description = "Publisher of the image used to create VM"
}
variable "offer" {
  description = "Offer of the image used to create VM"
}
variable "sku" {
  description = "SKU of the image used to create VM"
}
variable "_version" {
  description = "Version of the image used to create VM, underscore added to avoid Terraform error"
}

variable "tag" {
  description = "Resource tag value"
}
