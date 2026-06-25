
resource "azurerm_resource_group" "network" {
  name     = "rg-enterprise-network"
  location = var.location
  tags     = var.tags
}

resource "azurerm_resource_group" "security" {
  name     = "rg-enterprise-security"
  location = var.location
  tags     = var.tags
}

resource "azurerm_resource_group" "monitoring" {
  name     = "rg-enterprise-monitoring"
  location = var.location
  tags     = var.tags
}

resource "azurerm_resource_group" "identity" {
  name     = "rg-enterprise-identity"
  location = var.location
  tags     = var.tags
}

resource "azurerm_resource_group" "dev" {
  name     = "rg-enterprise-dev"
  location = var.location
  tags     = var.tags
}

resource "azurerm_resource_group" "prod" {
  name     = "rg-enterprise-prod"
  location = var.location
  tags     = var.tags
}
