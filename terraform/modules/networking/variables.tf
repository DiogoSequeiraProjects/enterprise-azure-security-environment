variable "location" {
  description = "Azure region."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group where networking resources will be deployed."
  type        = string
}

variable "tags" {
  description = "Common resource tags."
  type        = map(string)
}
