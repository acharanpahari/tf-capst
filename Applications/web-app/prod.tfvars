
rg_name = "web_app_rg_prd"
location = "West US"
tags = {
    "environment" = "prod"
    "department"  = "marketing"
  }

vnet_name = "web_app_vnet_prd"
vnet_cidr = ["11.10.12.0/24"]
subnet_name = "web_app_subnet_prd"
subnet_cidr = ["11.10.12.0/27"]

nsg_name = "web_app_nsg_prd"
vm_size = "Standard_B2s"
nic_name = "web_app_nic_00_prd"
public_ip_name = "web_app_ip_prd"
vm_name = "web-app-vm_prd"
vm_osDisk_Caching = "None"
vm_osDisk_storageType = "Standard_LRS"
vm_image_offer = "0001-com-ubuntu-server-focal"
vm_image_publisher = "canonical"
vm_image_sku = "20_04-lts-gen2"
vm_image_version = "latest"
vm_ssh_key = file("./ssh/id_rsa.pub")
