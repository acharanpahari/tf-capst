
data "azurerm_key_vault" "key_vault" {
  name                = "mykeyvault"
  resource_group_name = "kvaults-rg"
}

data "azurerm_key_vault_secret" "username" {
  name         = "user"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}

data "azurerm_key_vault_secret" "ssh-public-key" {
  name         = "ssh-public-key"
  key_vault_id = "/subscriptions/f52a4403-4d69-45d0-babf-63321e10cc70/resourceGroups/kvaults-rg/providers/Microsoft.KeyVault/vaults/creds-kv"
}

