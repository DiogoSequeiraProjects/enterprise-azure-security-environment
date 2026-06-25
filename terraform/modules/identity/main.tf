resource "azurerm_user_assigned_identity" "workload" {
  name                = "id-enterprise-workload-weu-001"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}
