resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = var.nic_location
  resource_group_name = var.nic_rg

  ip_configuration {
    name                          = var.nic_ip_config_name
    subnet_id                     = var.nic_ip_config_subnet_id
    private_ip_address_allocation = var.nic_ip_config_private_ip_allocation
    public_ip_address_id          = var.nic_ip_config_public_ip_id
  }
  tags = var.nic_tags
}