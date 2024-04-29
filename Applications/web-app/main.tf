variable "vnet_cidr" {
  default = ["11.10.12.0/24"]
}

variable "subnet_cidr" {
  default = ["11.10.12.0/27"]
}

variable "vm_size" {
  default = "Standard_B1s"
}


locals {
  subnet = "11.10.12.0/27"
  location = "West US"
  common_tags = {
    "environment" = "dev"
    "department"  = "marketing"
  }
}

module "web_app_rg" {
  source                  = "../../Modules/resource-group"
  resource_group_name     = "web_app_rg"
  resource_group_location = local.location
  resource_group_tag      = local.common_tags
}

module "web_app_vnet" {
  source        = "../../Modules/virtual-network"
  vnet_name     = "web_app_vnet"
  vnet_rg       = module.web_app_rg.resource_group_name
  vnet_location = module.web_app_rg.resource_group_location
  vnet_cidr     = var.vnet_cidr
  vnet_tag      = local.common_tags
}

module "web_app_subnet" {
  source      = "../../Modules/subnet"
  subnet_name = "web_app_subnet"
  subnet_rg   = module.web_app_rg.resource_group_name
  subnet_vnet = module.web_app_vnet.vnet_name
  subnet_cidr = var.subnet_cidr
}

module "web_app_route_table" {
  source                            = "../../Modules/route-table"
  route_table_name                  = "web_app_rt"
  route_table_location              = module.web_app_rg.resource_group_location
  route_table_rg                    = module.web_app_rg.resource_group_name
  route_table_tags                  = local.common_tags
  route_name                        = "web_app_route"
  route_cidr                        = "0.0.0.0/0"
  route_next_hop                    = "VirtualAppliance"
  route_next_hop_ip                 = module.web_app_public_ip.public_ip
  route_table_subnet_id_association = module.web_app_subnet.subnet_id
}

module "web_app_nsg" {
  source       = "../../Modules/nsg"
  nsg_name     = "web_app_nsg"
  nsg_location = module.web_app_rg.resource_group_location
  nsg_rg       = module.web_app_rg.resource_group_name
  nsg_rules = [
    {
      name             = "allow_ssh_in"
      priority         = 101
      direction        = "Inbound"
      source_port      = "22"
      destination_port = "22"
      source_cidr      = "0.0.0.0/0"
      destination_cidr = "${local.subnet}"
    },
    {
      name             = "allow_ssh_out"
      priority         = 102
      direction        = "Outbound"
      source_port      = "22"
      destination_port = "22"
      source_cidr      = "0.0.0.0/0"
      destination_cidr = "${local.subnet}"
    },
    {
      name             = "allow_http_in"
      priority         = 103
      direction        = "Inbound"
      source_port      = "80"
      destination_port = "80"
      source_cidr      = "0.0.0.0/0"
      destination_cidr = "${local.subnet}"
    },
    {
      name             = "allow_http_out"
      priority         = 104
      direction        = "Outbound"
      source_port      = "80"
      destination_port = "80"
      source_cidr      = "0.0.0.0/0"
      destination_cidr = "${local.subnet}"
    },
  ]
  nsg_tags = local.common_tags
}

module "web_app_nsg_subnet_associating" {
  source    = "../../Modules/nsg-subnet-association"
  subnet_id = module.web_app_subnet.subnet_id
  nsg_id    = module.web_app_nsg.nsg_id
}

module "web_app_vm_nic" {
  source                              = "../../Modules/nic"
  nic_name                            = "web_app_nic_00"
  nic_location                        = module.web_app_rg.resource_group_location
  nic_rg                              = module.web_app_rg.resource_group_name
  nic_ip_config_name                  = "web_app_nic_config"
  nic_ip_config_private_ip_allocation = "Dynamic"
  nic_ip_config_subnet_id             = module.web_app_subnet.subnet_id
  nic_ip_config_public_ip_id          = module.web_app_public_ip.public_ip_id
  nic_tags                            = local.common_tags
}

module "web_app_public_ip" {
  source                      = "../../Modules/public-ip"
  public_ip_name              = "web_app_ip"
  public_ip_location          = module.web_app_rg.resource_group_location
  public_ip_allocation_method = "Static"
  public_ip_rg                = module.web_app_rg.resource_group_name
  public_ip_tags              = local.common_tags
}

module "web_linux_vm" {
  source                       = "../../Modules/linux-vm"
  linux_vm_name                = "web-app-vm"
  linux_vm_location            = module.web_app_rg.resource_group_location
  linux_vm_rg                  = module.web_app_rg.resource_group_name
  linux_vm_size                = var.vm_size
  linux_vm_admin               = data.azurerm_key_vault_secret.username.value
  linux_vm_nic_ids             = ["${module.web_app_vm_nic.nic_id}"]
  linux_vm_osDisk_caching      = "None"
  linux_vm_osDisk_storage_type = "Standard_LRS"
  linux_vm_osDisk_size         = 30
  linux_vm_image_offer         = "0001-com-ubuntu-server-focal"
  linux_vm_image_publisher     = "canonical"
  linux_vm_image_sku           = "20_04-lts-gen2"
  linux_vm_image_version       = "latest"
  ssh_key = file("./ssh/id_rsa.pub")
}




