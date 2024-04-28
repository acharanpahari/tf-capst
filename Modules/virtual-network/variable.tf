variable "vnet_name" {
  default = "web_app_vnet"
}

variable "vnet_location" {
  default = "West US"
}

variable "vnet_rg" {
  default = "web_app_rg"
}

variable "vnet_cidr" {
  default = ["10.0.0.0/16"]
}

variable "vnet_tag" {
  default = {
    "environment" = "dev"
    "department" = "marketing" }
  
}