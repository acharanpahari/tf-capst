resource "azurerm_linux_virtual_machine" "linux_vm" {
  name                = var.linux_vm_name
  resource_group_name = var.linux_vm_rg
  location            = var.linux_vm_location
  size                = var.linux_vm_size
  admin_username      = var.linux_vm_admin
  

  computer_name = var.linux_vm_name
  
  custom_data = data.cloudinit_config.bash.rendered
  network_interface_ids = var.linux_vm_nic_ids

 
  admin_ssh_key {
    username   = var.linux_vm_admin
    public_key = tls_private_key.ssh-key.public_key_openssh
  }
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


resource "tls_private_key" "ssh-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_sensitive_file" "ssh_key_file" {
  content  = tls_private_key.ssh-key.private_key_pem
  filename = "./sshkey.pem"
}

data "cloudinit_config" "bash" {
  gzip          = false
  base64_encode = true

  part {
    filename     = "customData.sh"
    content_type = "text/x-shellscript"

    content = file("${path.module}/customData.sh")
  }
}