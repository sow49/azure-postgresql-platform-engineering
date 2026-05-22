# 1. Ton Groupe de Ressources existant
resource "azurerm_resource_group" "rg" {
  name     = "rg-terraform-cloud-dba"
  location = "France Central"
}

# 2. Le Réseau Virtuel (VNet) - Le réseau privé de ton lab
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-postgresql-prod"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
}

# 3. Le Sous-réseau (Subnet) dédié à PostgreSQL
# Azure impose cette délégation spécifique pour isoler le mode Flexible Server
resource "azurerm_subnet" "pg_subnet" {
  name                 = "snet-postgres-db"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]

  delegation {
    name = "fs-delegation"
    service_delegation {
      name    = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
}