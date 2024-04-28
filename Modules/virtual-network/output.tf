output "vnet_id" {
  value = azurerm_virtual_network.web_app_vnet.id
}

output "vnet_name" {
  value = azurerm_virtual_network.web_app_vnet.name
}

output "vnet_cidr" {
  value = azurerm_virtual_network.web_app_vnet.address_space
}