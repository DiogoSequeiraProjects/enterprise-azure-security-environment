data "azurerm_client_config" "current" {}

resource "azurerm_user_assigned_identity" "main" {
  name                = "id-enterprise-security-weu-001"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_key_vault" "main" {
  name                          = "kv-enterprise-weu-001"
  location                      = var.location
  resource_group_name           = var.resource_group_name
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  sku_name                      = "standard"
  public_network_access_enabled = false
  purge_protection_enabled      = false
  soft_delete_retention_days    = 7
  rbac_authorization_enabled = true     = true
  tags                          = var.tags
}

resource "azurerm_private_dns_zone" "keyvault" {
  name                = "privatelink.vaultcore.azure.net"
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_private_endpoint" "keyvault" {
  name                = "pe-kv-enterprise-weu-001"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.private_endpoint_subnet_id
  tags                = var.tags

  private_service_connection {
    name                           = "psc-kv-enterprise-weu-001"
    private_connection_resource_id = azurerm_key_vault.main.id
    subresource_names              = ["vault"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "pdzg-keyvault"
    private_dns_zone_ids = [azurerm_private_dns_zone.keyvault.id]
  }
}

resource "azurerm_key_vault_secret" "demo_secret" {
  name         = "demo-secret"
  value        = "This is a placeholder secret for portfolio demonstration."
  key_vault_id = azurerm_key_vault.main.id
}
