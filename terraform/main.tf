# Enterprise Azure Security Environment
# Root Terraform configuration

module "resource_groups" {
  source   = "./modules/resource-groups"
  location = var.location
  tags     = var.tags
}

module "networking" {
  source              = "./modules/networking"
  location            = var.location
  resource_group_name = module.resource_groups.network_rg_name
  tags                = var.tags
}

module "security" {
  source                     = "./modules/security"
  location                   = var.location
  resource_group_name        = module.resource_groups.security_rg_name
  private_endpoint_subnet_id = module.networking.hub_security_subnet_id
  tags                       = var.tags
}

module "monitoring" {
  source              = "./modules/monitoring"
  location            = var.location
  resource_group_name = module.resource_groups.monitoring_rg_name
  subscription_id     = var.subscription_id
  alert_email         = var.alert_email
  tags                = var.tags
}

module "identity" {
  source              = "./modules/identity"
  location            = var.location
  resource_group_name = module.resource_groups.identity_rg_name
  tags                = var.tags
}

module "governance" {
  source          = "./modules/governance"
  subscription_id = var.subscription_id
}
