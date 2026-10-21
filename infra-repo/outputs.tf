output "rg_name" {
  value = azurerm_resource_group.this.name
}

output "acr_name" {
  value = module.acr.name
}
output "acr_login_server" {
  value = module.acr.login_server
}
output "aks_name" {
  value = module.aks.name
}
output "kv_name" {
  value = module.keyvault.name
}

output "sql_server_fqdn" {
  value = module.sql.server_fqdn
}

output "storage_name" {
  value = module.storage.name
}
output "servicebus_namespace" {
  value = module.servicebus.namespace_name
}
output "function_app_name" {
  value = module.functionapp.name
}