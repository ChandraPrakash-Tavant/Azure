output "id" {
  value      = azurerm_key_vault.this.id
  depends_on = [azurerm_key_vault_access_policy.admins]
}
output "name" {
  value = azurerm_key_vault.this.name
}