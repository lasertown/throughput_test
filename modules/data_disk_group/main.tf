  
provider "azurerm" {
  features {}
}

resource "azurerm_managed_disk" "disk0" {
  name                 = "disk0"
  location             = var.region
  resource_group_name  = var.rg
  storage_account_type = var.disk_type
  create_option        = "Empty"
  disk_size_gb         = var.sizeGB
}
resource "azurerm_virtual_machine_data_disk_attachment" "disk0" {
  managed_disk_id    = azurerm_managed_disk.disk0.id
  virtual_machine_id = var.vmID
  lun                = "0"
  caching            = var.caching
}

resource "azurerm_managed_disk" "disk1" {
  name                 = "disk1"
  location             = var.region
  resource_group_name  = var.rg
  storage_account_type = var.disk_type
  create_option        = "Empty"
  disk_size_gb         = var.sizeGB
}
resource "azurerm_virtual_machine_data_disk_attachment" "disk1" {
  managed_disk_id    = azurerm_managed_disk.disk1.id
  virtual_machine_id = var.vmID
  lun                = "1"
  caching            = var.caching
}

resource "azurerm_managed_disk" "disk2" {
  name                 = "disk2"
  location             = var.region
  resource_group_name  = var.rg
  storage_account_type = var.disk_type
  create_option        = "Empty"
  disk_size_gb         = var.sizeGB
}
resource "azurerm_virtual_machine_data_disk_attachment" "disk2" {
  managed_disk_id    = azurerm_managed_disk.disk2.id
  virtual_machine_id = var.vmID
  lun                = "2"
  caching            = var.caching
}

resource "azurerm_managed_disk" "disk3" {
  name                 = "disk3"
  location             = var.region
  resource_group_name  = var.rg
  storage_account_type = var.disk_type
  create_option        = "Empty"
  disk_size_gb         = var.sizeGB
}
resource "azurerm_virtual_machine_data_disk_attachment" "disk3" {
  managed_disk_id    = azurerm_managed_disk.disk3.id
  virtual_machine_id = var.vmID
  lun                = "3"
  caching            = var.caching
}


resource "azurerm_managed_disk" "disk4" {
  name                 = "disk4"
  location             = var.region
  resource_group_name  = var.rg
  storage_account_type = var.disk_type
  create_option        = "Empty"
  disk_size_gb         = var.sizeGB
}
resource "azurerm_virtual_machine_data_disk_attachment" "disk4" {
  managed_disk_id    = azurerm_managed_disk.disk4.id
  virtual_machine_id = var.vmID
  lun                = "4"
  caching            = var.caching
}

resource "azurerm_managed_disk" "disk5" {
  name                 = "disk5"
  location             = var.region
  resource_group_name  = var.rg
  storage_account_type = var.disk_type
  create_option        = "Empty"
  disk_size_gb         = var.sizeGB
}
resource "azurerm_virtual_machine_data_disk_attachment" "disk5" {
  managed_disk_id    = azurerm_managed_disk.disk5.id
  virtual_machine_id = var.vmID
  lun                = "5"
  caching            = var.caching
}

resource "azurerm_managed_disk" "disk6" {
  name                 = "disk6"
  location             = var.region
  resource_group_name  = var.rg
  storage_account_type = var.disk_type
  create_option        = "Empty"
  disk_size_gb         = var.sizeGB
}
resource "azurerm_virtual_machine_data_disk_attachment" "disk6" {
  managed_disk_id    = azurerm_managed_disk.disk6.id
  virtual_machine_id = var.vmID
  lun                = "6"
  caching            = var.caching
}

resource "azurerm_managed_disk" "disk7" {
  name                 = "disk7"
  location             = var.region
  resource_group_name  = var.rg
  storage_account_type = var.disk_type
  create_option        = "Empty"
  disk_size_gb         = var.sizeGB
}
resource "azurerm_virtual_machine_data_disk_attachment" "disk7" {
  managed_disk_id    = azurerm_managed_disk.disk7.id
  virtual_machine_id = var.vmID
  lun                = "7"
  caching            = var.caching
}

resource "azurerm_managed_disk" "disk8" {
  name                 = "disk8"
  location             = var.region
  resource_group_name  = var.rg
  storage_account_type = var.disk_type
  create_option        = "Empty"
  disk_size_gb         = var.sizeGB
}
resource "azurerm_virtual_machine_data_disk_attachment" "disk8" {
  managed_disk_id    = azurerm_managed_disk.disk8.id
  virtual_machine_id = var.vmID
  lun                = "8"
  caching            = var.caching
}

resource "azurerm_managed_disk" "disk9" {
  name                 = "disk9"
  location             = var.region
  resource_group_name  = var.rg
  storage_account_type = var.disk_type
  create_option        = "Empty"
  disk_size_gb         = var.sizeGB
}
resource "azurerm_virtual_machine_data_disk_attachment" "disk9" {
  managed_disk_id    = azurerm_managed_disk.disk9.id
  virtual_machine_id = var.vmID
  lun                = "9"
  caching            = var.caching
}
