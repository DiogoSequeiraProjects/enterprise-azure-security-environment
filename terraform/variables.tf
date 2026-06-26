variable "location" {
  description = "Azure region used for all resources."
  type        = string
  default     = "westeurope"
}

variable "project_name" {
  description = "Project name used for tagging."
  type        = string
  default     = "Enterprise Azure Security Environment"
}

variable "owner" {
  description = "Resource owner."
  type        = string
  default     = "Diogo-Sequeira"
}

variable "tags" {
  description = "Common tags applied to all resources."
  type        = map(string)

  default = {
    Project     = "Enterprise Azure Security Environment"
    Owner       = "Diogo Sequeira"
    Environment = "Portfolio"
    ManagedBy   = "Terraform"
    Purpose     = "Cloud Security Portfolio"
  }
}

variable "subscription_id" {
  description = "Azure Subscription ID used for monitoring alert scopes and governance policy assignments."
  type        = string
  default     = "00000000-0000-0000-0000-000000000000"
}

variable "alert_email" {
  description = "Email address used for Azure Monitor alert notifications."
  type        = string
  default     = "your-email@example.com"
}
