resource "azurerm_service_plan" "this" {
  name                = "${var.prefix}-func-plan"
  location            = var.location
  resource_group_name = var.rg_name
  os_type             = "Linux"
  sku_name            = "Y1"
}

resource "azurerm_linux_function_app" "this" {
  name                       = "${var.prefix}-func"
  location                   = var.location
  resource_group_name        = var.rg_name
  service_plan_id            = azurerm_service_plan.this.id
  storage_account_name       = var.storage_name
  storage_account_access_key = var.storage_key
  site_config {
    application_insights_connection_string = var.appi_connection_string
    application_stack {
      python_version = "3.11"
    }
  }
  app_settings = {
    ServiceBusConnection = var.servicebus_connection_string
  }

}