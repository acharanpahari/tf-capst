variable "nsg_name" {}
variable "nsg_location" {}
variable "nsg_rg" {}
variable "nsg_tags" {
  
}




variable "nsg_rules" {
  # default = [{
  #   name = allow_ssh
  #   priority = 101
  #   direction = "Inbound"
  #   source_port = "22"
  #   destination_port = "22"
  #   source_cidr = "0.0.0.0/0"
  #   destination_cidr = "10.11.12.0/27"
  # }]
}


