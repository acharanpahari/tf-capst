
data "azurerm_key_vault" "key_vault" {
  name                = var.vm_username_keyVault
  resource_group_name = var.vm_username_keyVault_rg
}

data "azurerm_key_vault_secret" "username" {
  name         = "user"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}


