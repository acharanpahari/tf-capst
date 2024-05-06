
rg_name = "web_app_rg_dev"
location = "East US"
tags = {
    "environment" = "dev"
    "department"  = "marketing"
  }

vnet_name = "web_app_vnet_dev"
vnet_cidr = ["10.11.12.0/24"]
subnet_name = "web_app_subnet_dev"
subnet_cidr = ["10.11.12.0/27"]

nsg_name = "web_app_nsg_dev"
vm_size = "Standard_B1s"
nic_name = "web_app_nic_00_dev"
public_ip_name = "web_app_ip_dev"
vm_name = "web-app-vm-dev"
vm_osDisk_Caching = "None"
vm_osDisk_storageType = "Standard_LRS"
vm_image_offer = "0001-com-ubuntu-server-focal"
vm_image_publisher = "canonical"
vm_image_sku = "20_04-lts-gen2"
vm_image_version = "latest"
vm_username_keyVault = "creds-kv"
vm_username_keyVault_rg = "kvaults-rg"

nsg_rules = [
    {
      name             = "allow_http_in" 
      priority         = 103 
      direction        = "Inbound" 
      source_port      = "*" 
      destination_port = "80" 
      source_cidr      = "0.0.0.0/0" 
      destination_cidr = "10.11.12.0/27"
    }
  ]
