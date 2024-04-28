resource "azurerm_resource_group" "web_app_rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
  tags = var.resource_group_tag
}