data "azurerm_key_vault_secret" "username" {
  name         = "user"
  key_vault_id = data.azurerm_key_vault.existing.id
}

data "azurerm_key_vault_secret" "password" {
  name         = "password"
  key_vault_id = data.azurerm_key_vault.existing.id
}

