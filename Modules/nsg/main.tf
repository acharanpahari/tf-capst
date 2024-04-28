
resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.nsg_location
  resource_group_name = var.nsg_rg

  
  
  dynamic "security_rule" {
    for_each = var.nsg_rules
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = security_rule.value.source_port
      destination_port_range     = security_rule.value.destination_port
      source_address_prefix      = security_rule.value.source_cidr
      destination_address_prefix = "${security_rule.value.destination_cidr}"
    }
  }

  tags = var.nsg_tags
}


