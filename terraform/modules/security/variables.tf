variable "location" {
  description = "Azure region."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group where security resources will be deployed."
  type        = string
}

variable "private_endpoint_subnet_id" {
  description = "Subnet ID used for the Key Vault Private Endpoint."
  type        = string
}

variable "tags" {
  description = "Common resource tags."
  type        = map(string)
}
