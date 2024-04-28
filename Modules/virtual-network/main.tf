resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.vnet_location
  resource_group_name = var.vnet_rg
  address_space       = var.vnet_cidr
  tags = var.vnet_tag
}