output "public_ip_id" {
  value = azurerm_public_ip.public_ip.id
}

output "public_ip" {
  value = azurerm_public_ip.public_ip.ip_address
}