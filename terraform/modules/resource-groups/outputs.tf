output "network_rg_name" {
  value = azurerm_resource_group.network.name
}

output "security_rg_name" {
  value = azurerm_resource_group.security.name
}

output "monitoring_rg_name" {
  value = azurerm_resource_group.monitoring.name
}

output "identity_rg_name" {
  value = azurerm_resource_group.identity.name
}

output "dev_rg_name" {
  value = azurerm_resource_group.dev.name
}

output "prod_rg_name" {
  value = azurerm_resource_group.prod.name
}
