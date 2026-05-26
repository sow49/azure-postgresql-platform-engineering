resource "azurerm_resource_group" "rg" {
  name     = "rg-terraform-cloud-dba"
  location = "France Central"
}

resource "azurerm_log_analytics_workspace" "logs" {

  name                = "law-postgresql-monitoring"

  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku                 = "PerGB2018"

  retention_in_days   = 30
}