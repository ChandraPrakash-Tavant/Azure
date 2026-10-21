resource "azurerm_storage_account" "this" {
  name                     = "${var.prefix}storageaccount"
  location                 = var.location
  resource_group_name      = var.rg_name
  account_tier             = "Standard"
  account_replication_type = "LRS"

}
