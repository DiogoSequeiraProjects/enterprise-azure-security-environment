resource "azurerm_virtual_network" "hub" {
  name                = "vnet-hub-weu-001"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]
  tags                = var.tags
}

resource "azurerm_subnet" "hub_management" {
  name                 = "snet-hub-management"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "hub_security" {
  name                 = "snet-hub-security"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "hub_shared_services" {
  name                 = "snet-hub-shared-services"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefixes     = ["10.0.3.0/24"]
}

resource "azurerm_virtual_network" "dev" {
  name                = "vnet-dev-weu-001"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.1.0.0/16"]
  tags                = var.tags
}

resource "azurerm_subnet" "dev_app" {
  name                 = "snet-dev-app"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.dev.name
  address_prefixes     = ["10.1.1.0/24"]
}

resource "azurerm_subnet" "dev_data" {
  name                 = "snet-dev-data"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.dev.name
  address_prefixes     = ["10.1.2.0/24"]
}

resource "azurerm_virtual_network" "prod" {
  name                = "vnet-prod-weu-001"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.2.0.0/16"]
  tags                = var.tags
}

resource "azurerm_subnet" "prod_app" {
  name                 = "snet-prod-app"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.prod.name
  address_prefixes     = ["10.2.1.0/24"]
}

resource "azurerm_subnet" "prod_data" {
  name                 = "snet-prod-data"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.prod.name
  address_prefixes     = ["10.2.2.0/24"]
}

resource "azurerm_virtual_network_peering" "hub_to_dev" {
  name                         = "peer-hub-to-dev"
  resource_group_name          = var.resource_group_name
  virtual_network_name         = azurerm_virtual_network.hub.name
  remote_virtual_network_id    = azurerm_virtual_network.dev.id
  allow_virtual_network_access = true
}

resource "azurerm_virtual_network_peering" "dev_to_hub" {
  name                      = "peer-dev-to-hub"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.dev.name
  remote_virtual_network_id = azurerm_virtual_network.hub.id
  allow_virtual_network_access = true
}

resource "azurerm_virtual_network_peering" "hub_to_prod" {
  name                      = "peer-hub-to-prod"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.hub.name
  remote_virtual_network_id = azurerm_virtual_network.prod.id
  allow_virtual_network_access = true
}

resource "azurerm_virtual_network_peering" "prod_to_hub" {
  name                      = "peer-prod-to-hub"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.prod.name
  remote_virtual_network_id = azurerm_virtual_network.hub.id
  allow_virtual_network_access = true
}

resource "azurerm_network_security_group" "management" {
  name                = "nsg-management"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_network_security_group" "dev_app" {
  name                = "nsg-dev-app"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_network_security_group" "dev_data" {
  name                = "nsg-dev-data"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_network_security_group" "prod_app" {
  name                = "nsg-prod-app"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_network_security_group" "prod_data" {
  name                = "nsg-prod-data"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_network_security_rule" "allow_hub_https" {
  name                        = "Allow-Hub-HTTPS"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "10.0.0.0/16"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.management.name
}

resource "azurerm_network_security_rule" "allow_dev_app_to_data" {
  name                        = "Allow-App-To-DB"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "1433"
  source_address_prefix       = "10.1.1.0/24"
  destination_address_prefix  = "10.1.2.0/24"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.dev_data.name
}

resource "azurerm_network_security_rule" "allow_prod_app_to_data" {
  name                        = "Allow-App-To-DB"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "1433"
  source_address_prefix       = "10.2.1.0/24"
  destination_address_prefix  = "10.2.2.0/24"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.prod_data.name
}

resource "azurerm_subnet_network_security_group_association" "hub_management" {
  subnet_id                 = azurerm_subnet.hub_management.id
  network_security_group_id = azurerm_network_security_group.management.id
}

resource "azurerm_subnet_network_security_group_association" "dev_app" {
  subnet_id                 = azurerm_subnet.dev_app.id
  network_security_group_id = azurerm_network_security_group.dev_app.id
}

resource "azurerm_subnet_network_security_group_association" "dev_data" {
  subnet_id                 = azurerm_subnet.dev_data.id
  network_security_group_id = azurerm_network_security_group.dev_data.id
}

resource "azurerm_subnet_network_security_group_association" "prod_app" {
  subnet_id                 = azurerm_subnet.prod_app.id
  network_security_group_id = azurerm_network_security_group.prod_app.id
}

resource "azurerm_subnet_network_security_group_association" "prod_data" {
  subnet_id                 = azurerm_subnet.prod_data.id
  network_security_group_id = azurerm_network_security_group.prod_data.id
}

resource "azurerm_route_table" "hub" {
  name                = "rt-hub-weu-001"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_route_table" "dev" {
  name                = "rt-dev-weu-001"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_route_table" "prod" {
  name                = "rt-prod-weu-001"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_subnet_route_table_association" "hub_management" {
  subnet_id      = azurerm_subnet.hub_management.id
  route_table_id = azurerm_route_table.hub.id
}

resource "azurerm_subnet_route_table_association" "dev_app" {
  subnet_id      = azurerm_subnet.dev_app.id
  route_table_id = azurerm_route_table.dev.id
}

resource "azurerm_subnet_route_table_association" "dev_data" {
  subnet_id      = azurerm_subnet.dev_data.id
  route_table_id = azurerm_route_table.dev.id
}

resource "azurerm_subnet_route_table_association" "prod_app" {
  subnet_id      = azurerm_subnet.prod_app.id
  route_table_id = azurerm_route_table.prod.id
}

resource "azurerm_subnet_route_table_association" "prod_data" {
  subnet_id      = azurerm_subnet.prod_data.id
  route_table_id = azurerm_route_table.prod.id
}
