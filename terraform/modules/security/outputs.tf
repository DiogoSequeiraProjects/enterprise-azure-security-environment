output "key_vault_id" {
  value = azurerm_key_vault.main.id
}

output "key_vault_name" {
  value = azurerm_key_vault.main.name
}

output "managed_identity_id" {
  value = azurerm_user_assigned_identity.main.id
}

output "private_endpoint_id" {
  value = azurerm_private_endpoint.keyvault.id
}

output "private_dns_zone_id" {
  value = azurerm_private_dns_zone.keyvault.id
}
