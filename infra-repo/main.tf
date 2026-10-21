resource "azurerm_resource_group" "this" {
  name     = "${var.prefix}-rg"
  location = var.location
}

# ---------- Phase 1 ----------
module "network" {
  source   = "./modules/network"
  prefix   = var.prefix
  location = var.location
  rg_name  = azurerm_resource_group.this.name
}

module "monitoring" {
  source   = "./modules/monitoring"
  prefix   = var.prefix
  location = var.location
  rg_name  = azurerm_resource_group.this.name
}
module "acr" {
  source   = "./modules/acr"
  prefix   = var.prefix
  location = var.location
  rg_name  = azurerm_resource_group.this.name
}

module "aks" {
  source        = "./modules/aks"
  prefix        = var.prefix
  location      = var.location
  rg_name       = azurerm_resource_group.this.name
  node_size     = var.aks_node_size
  node_count    = var.aks_node_count
  aks_subnet_id = module.network.aks_subnet_id
  acr_id        = module.acr.id
  law_id        = module.monitoring.law_id
}
module "keyvault" {
  source           = "./modules/keyvault"
  prefix           = var.prefix
  location         = var.location
  rg_name          = azurerm_resource_group.this.name
  admin_object_ids = var.kv_admin_object_ids
}
module "sql" {
  source       = "./modules/sql"
  prefix       = var.prefix
  location     = var.location
  rg_name      = azurerm_resource_group.this.name
  key_vault_id = module.keyvault.id
}

module "storage" {
  source   = "./modules/storage"
  prefix   = var.prefix
  location = var.location
  rg_name  = azurerm_resource_group.this.name
}
module "servicebus" {
  source   = "./modules/servicebus"
  prefix   = var.prefix
  location = var.location
  rg_name  = azurerm_resource_group.this.name
}


module "functionapp" {
  source                       = "./modules/functionapp"
  prefix                       = var.prefix
  location                     = var.location
  rg_name                      = azurerm_resource_group.this.name
  storage_name                 = module.storage.name
  storage_key                  = module.storage.access_key
  appi_connection_string       = module.monitoring.appi_connection_string
  servicebus_connection_string = module.servicebus.connection_string
}

# ---------- Voting app: Postgres password ----------
resource "random_password" "postgres" {
  length  = 20
  special = false
}

resource "azurerm_key_vault_secret" "postgres_password" {
  name         = "postgres-password"
  value        = random_password.postgres.result
  key_vault_id = module.keyvault.id
}