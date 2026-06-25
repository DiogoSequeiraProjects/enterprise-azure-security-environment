output "hub_vnet_id" {
  value = azurerm_virtual_network.hub.id
}

output "dev_vnet_id" {
  value = azurerm_virtual_network.dev.id
}

output "prod_vnet_id" {
  value = azurerm_virtual_network.prod.id
}

output "hub_management_subnet_id" {
  value = azurerm_subnet.hub_management.id
}

output "hub_security_subnet_id" {
  value = azurerm_subnet.hub_security.id
}

output "dev_app_subnet_id" {
  value = azurerm_subnet.dev_app.id
}

output "prod_app_subnet_id" {
  value = azurerm_subnet.prod_app.id
}
