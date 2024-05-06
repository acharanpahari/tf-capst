variable "rg_name" {
  default = "web_app_rg"
}

variable "location" {
  default = "West US"
}
variable "tags" {
  default = {
    "environment" = "dev"
    "department"  = "marketing"
  }
}
variable "vnet_name" {
  default = "web_app_vnet"
}
variable "vnet_cidr" {
  default = ["11.10.12.0/24"]
}

variable "subnet_name" {
  default = "web_app_subnet"
}
variable "subnet_cidr" {
  default = ["11.10.12.0/27"]
}

variable "nsg_name" {
  default = "web_app_nsg"
}
variable "vm_size" {
  default = "Standard_B1s"
}

variable "nic_name" {
  default = "web_app_nic_00"
}

variable "public_ip_name" {
  default = "web_app_ip"
}

variable "vm_name" {
  default = "web-app-vm"
}

variable "vm_osDisk_Caching" {
  default = "None"
}

variable "vm_osDisk_storageType" {
  default = "Standard_LRS"
}

variable "vm_image_offer" {
  default = "0001-com-ubuntu-server-focal"
}

variable "vm_image_publisher" {
  default = "canonical"
}

variable "vm_image_sku" {
  default = "20_04-lts-gen2"
}

variable "vm_image_version" {
  default = "latest"
}

variable "vm_username_keyVault" {
  default = "creds-kv"
}

variable "vm_username_keyVault_rg" {
  default = "kvaults-rg"
}

variable "nsg_rules" {

}
