variable "location" {
  description = "Azure region."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group where monitoring resources will be deployed."
  type        = string
}

variable "subscription_id" {
  description = "Azure Subscription ID used as the alert scope."
  type        = string
}

variable "alert_email" {
  description = "Email address used by the Azure Monitor Action Group."
  type        = string
}

variable "tags" {
  description = "Common resource tags."
  type        = map(string)
}
