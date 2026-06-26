
output "network_resource_group" {
  description = "Name of the networking resource group."
  value       = module.resource_groups.network_rg_name
}

output "security_resource_group" {
  description = "Name of the security resource group."
  value       = module.resource_groups.security_rg_name
}

output "monitoring_resource_group" {
  description = "Name of the monitoring resource group."
  value       = module.resource_groups.monitoring_rg_name
}

output "hub_vnet_id" {
  description = "ID of the Hub Virtual Network."
  value       = module.networking.hub_vnet_id
}

output "dev_vnet_id" {
  description = "ID of the Development Virtual Network."
  value       = module.networking.dev_vnet_id
}

output "prod_vnet_id" {
  description = "ID of the Production Virtual Network."
  value       = module.networking.prod_vnet_id
}

output "key_vault_name" {
  description = "Name of the Azure Key Vault."
  value       = module.security.key_vault_name
}

output "log_analytics_workspace_name" {
  description = "Name of the Log Analytics Workspace."
  value       = module.monitoring.log_analytics_workspace_name
}

output "workload_identity_name" {
  description = "Name of the workload managed identity."
  value       = module.identity.workload_identity_name
}
