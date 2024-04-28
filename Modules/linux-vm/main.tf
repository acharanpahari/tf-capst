resource "azurerm_linux_virtual_machine" "linux_vm" {
  name                = var.linux_vm_name
  resource_group_name = var.linux_vm_rg
  location            = var.linux_vm_location
  size                = var.linux_vm_size
  admin_username      = var.linux_vm_admin
  admin_password = var.linux_vm_password
  
  network_interface_ids = var.linux_vm_nic_ids

 

  os_disk {
    caching              = var.linux_vm_osDisk_caching
    storage_account_type = var.linux_vm_osDisk_storage_type
    disk_size_gb         = var.linux_vm_osDisk_size
  }

  source_image_reference {
    publisher = var.linux_vm_image_publisher
    offer     = var.linux_vm_image_offer
    sku       = var.linux_vm_image_sku
    version   = var.linux_vm_image_version
  }
}