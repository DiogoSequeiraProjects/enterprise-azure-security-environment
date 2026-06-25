resource "azurerm_subscription_policy_assignment" "allowed_locations" {
  name                 = "allowed-locations-weu"
  display_name         = "Allowed locations - West Europe"
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/e56962a6-4747-49cd-b67b-bf8b01975c4c"
  subscription_id      = var.subscription_id

  parameters = jsonencode({
    listOfAllowedLocations = {
      value = [
        "westeurope"
      ]
    }
  })
}

resource "azurerm_subscription_policy_assignment" "require_resource_group_tags" {
  name                 = "require-rg-tags"
  display_name         = "Require tags on resource groups"
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/96670d01-0a5f-4da1-a96c-c6d0634626c2"
  subscription_id      = var.subscription_id

  parameters = jsonencode({
    tagName = {
      value = "Project"
    }
  })
}
