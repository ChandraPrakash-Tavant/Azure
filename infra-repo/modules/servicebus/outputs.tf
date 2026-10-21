output "namespace_name" {
  value = azurerm_servicebus_namespace.this.name
}
output "connection_string" {
  value     = azurerm_servicebus_namespace.this.default_primary_connection_string
  sensitive = true
}