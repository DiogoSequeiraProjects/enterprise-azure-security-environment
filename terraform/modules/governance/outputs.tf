output "allowed_locations_policy_assignment_id" {
  value = azurerm_subscription_policy_assignment.allowed_locations.id
}

output "required_tags_policy_assignment_id" {
  value = azurerm_subscription_policy_assignment.require_resource_group_tags.id
}
