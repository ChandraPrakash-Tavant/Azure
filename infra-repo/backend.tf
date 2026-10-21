terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstatechandra01"
    container_name       = "tfstate"
    key                  = "poc-infra.tfstate"

  }
}