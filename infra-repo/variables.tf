variable "prefix" {
  description = "The prefix to use for all resources"
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
}

variable "aks_node_size" {
  description = "The size of the AKS nodes"
  type        = string
}
variable "aks_node_count" {
  description = "The number of AKS nodes"
  type        = number
  default     = 1
}

variable "kv_admin_object_ids" {
  description = "The object IDs of the users/groups to be granted access to the Key Vault"
  type        = list(string)
  default     = []
}
