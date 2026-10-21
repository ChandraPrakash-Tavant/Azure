variable "prefix" {}
variable "location" {}
variable "rg_name" {}
variable "storage_name" {}
variable "storage_key" {
  sensitive = true
}
variable "appi_connection_string" {

  sensitive = true
}
variable "servicebus_connection_string" {
  sensitive = true
}