resource "azurerm_container_registry" "this" {
  name                = "${var.prefix}acr"
  resource_group_name = var.rg_name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = false
}