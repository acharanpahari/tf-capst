output "route_table_id" {
  value = azurerm_route_table.route_table.id
}

output "route_table_subnet" {
  value = azurerm_route_table.route_table.subnets
}

output "subnet_id" {
  value = azurerm_subnet_route_table_association.route_subnet_association.id
}