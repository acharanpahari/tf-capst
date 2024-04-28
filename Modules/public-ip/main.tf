resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_name
  resource_group_name = var.public_ip_rg
  location            = var.public_ip_location
  allocation_method   = var.public_ip_allocation_method
  tags                = var.public_ip_tags
}