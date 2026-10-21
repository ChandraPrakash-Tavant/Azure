resource "azurerm_servicebus_namespace" "this" {
  name                = "${var.prefix}-servicebus-namespace"
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "Basic"
}

resource "azurerm_servicebus_queue" "orders" {
  name         = "orders"
  namespace_id = azurerm_servicebus_namespace.this.id

}