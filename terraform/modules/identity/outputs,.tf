output "workload_identity_id" {
  value = azurerm_user_assigned_identity.workload.id
}

output "workload_identity_name" {
  value = azurerm_user_assigned_identity.workload.name
}
