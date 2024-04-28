resource "azurerm_route_table" "route_table" {
  name                          = var.route_table_name
  location                      = var.route_table_location
  resource_group_name           = var.route_table_rg

  route {
    name           = var.route_name
    address_prefix = var.route_cidr
    next_hop_type  = var.route_next_hop
    next_hop_in_ip_address = var.route_next_hop_ip

  }

  tags = var.route_table_tags
}

resource "azurerm_subnet_route_table_association" "route_subnet_association" {
  subnet_id      = var.route_table_subnet_id_association
  route_table_id = azurerm_route_table.route_table.id
}