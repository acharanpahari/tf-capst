terraform {
  backend "azurerm" {
    resource_group_name  = "tfstatefiles-rg"
    storage_account_name = "stactfstatefiles"
    container_name       = "con-tfstatefiles"
    key                  = "web-app/prod.tfstate"
  }
}
