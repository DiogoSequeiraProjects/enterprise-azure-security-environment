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
