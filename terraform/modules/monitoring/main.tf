resource "azurerm_log_analytics_workspace" "main" {
  name                = "law-enterprise-weu-001"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags                = var.tags
}

resource "azurerm_monitor_action_group" "main" {
  name                = "ag-enterprise-alerts"
  resource_group_name = var.resource_group_name
  short_name          = "entalerts"

  email_receiver {
    name                    = "primary-email"
    email_address           = var.alert_email
    use_common_alert_schema = true
  }

  tags = var.tags
}

resource "azurerm_monitor_activity_log_alert" "resource_delete" {
  name                = "alert-resource-delete"
  resource_group_name = var.resource_group_name
  location            = "global"
  scopes              = [var.subscription_id]
  description         = "Alert triggered when a resource deletion operation occurs."

  criteria {
    category       = "Administrative"
    operation_name = "Microsoft.Resources/subscriptions/resourceGroups/delete"
  }

  action {
    action_group_id = azurerm_monitor_action_group.main.id
  }

  tags = var.tags
}

resource "azurerm_monitor_activity_log_alert" "policy_assignment_write" {
  name                = "alert-policy-assignment-change"
  resource_group_name = var.resource_group_name
  location            = "global"
  scopes              = [var.subscription_id]
  description         = "Alert triggered when an Azure Policy assignment is created or modified."

  criteria {
    category       = "Administrative"
    operation_name = "Microsoft.Authorization/policyAssignments/write"
  }

  action {
    action_group_id = azurerm_monitor_action_group.main.id
  }

  tags = var.tags
}
