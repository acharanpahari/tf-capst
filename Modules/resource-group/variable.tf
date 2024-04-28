variable "resource_group_name" {
  default = "web_app"
}

variable "resource_group_location" {
  default = "West US"
}

variable "resource_group_tag" {
  default = {
    "environment" = "dev"
    "department" = "marketing" 
  }
}