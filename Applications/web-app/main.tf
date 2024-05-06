
module "web_app_rg" {
  source                  = "../../Modules/resource-group"
  resource_group_name     = var.rg_name
  resource_group_location = local.location
  resource_group_tag      = local.common_tags
}

module "web_app_vnet" {
  source        = "../../Modules/virtual-network"
  vnet_name     = var.vnet_name
  vnet_rg       = module.web_app_rg.resource_group_name
  vnet_location = module.web_app_rg.resource_group_location
  vnet_cidr     = var.vnet_cidr
  vnet_tag      = local.common_tags
}

module "web_app_subnet" {
  source      = "../../Modules/subnet"
  subnet_name = var.subnet_name
  subnet_rg   = module.web_app_rg.resource_group_name
  subnet_vnet = module.web_app_vnet.vnet_name
  subnet_cidr = cidrsubnets(var.vnet_cidr[0],3)
} 


module "web_app_nsg" {
  source       = "../../Modules/nsg"
  nsg_name     = var.nsg_name
  nsg_location = module.web_app_rg.resource_group_location
  nsg_rg       = module.web_app_rg.resource_group_name
  
  nsg_rules = var.nsg_rules 
  nsg_tags = local.common_tags
}

module "web_app_nsg_subnet_associating" {
  source    = "../../Modules/nsg-subnet-association"
  subnet_id = module.web_app_subnet.subnet_id
  nsg_id    = module.web_app_nsg.nsg_id
}

module "web_app_vm_nic" {
  source                              = "../../Modules/nic"
  nic_name                            = var.nic_name
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
  public_ip_name              = var.public_ip_name
  public_ip_location          = module.web_app_rg.resource_group_location
  public_ip_allocation_method = "Static"
  public_ip_rg                = module.web_app_rg.resource_group_name
  public_ip_tags              = local.common_tags
}

module "web_linux_vm" {
  source                       = "../../Modules/linux-vm"
  linux_vm_name                = var.vm_name
  linux_vm_location            = module.web_app_rg.resource_group_location
  linux_vm_rg                  = module.web_app_rg.resource_group_name
  linux_vm_size                = var.vm_size
  linux_vm_admin               = data.azurerm_key_vault_secret.username.value
  linux_vm_nic_ids             = ["${module.web_app_vm_nic.nic_id}"]
  linux_vm_osDisk_caching      = var.vm_osDisk_Caching
  linux_vm_osDisk_storage_type = var.vm_osDisk_storageType
  linux_vm_osDisk_size         = 30
  linux_vm_image_offer         = var.vm_image_offer
  linux_vm_image_publisher     = var.vm_image_publisher
  linux_vm_image_sku           = var.vm_image_sku
  linux_vm_image_version       = var.vm_image_version
  
}




