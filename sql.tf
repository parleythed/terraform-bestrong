
resource "azurerm_sql_server" "bestrong_sql" {
  name                         = "tfbestrongsqlserver"
  resource_group_name          = data.azurerm_resource_group.rg.name
  location                     = data.azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = var.sql_adminstrator_login
  administrator_login_password = var.sql_adminstrator_login_password
}

resource "azurerm_sql_database" "bestrong_sql_db" {
  name                = "bestrongdb"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  server_name         = azurerm_sql_server.bestrong_sql.name
}

resource "azurerm_private_endpoint" "bestrong_sql_private_endpoint" {
  name                = "bestrong-sql-private-endpoint"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  subnet_id           = azurerm_subnet.private_endpoint_subnet.id

  private_service_connection {
    name                           = "sqlPrivateEndpointConnection"
    private_connection_resource_id = azurerm_sql_server.bestrong_sql.id
    subresource_names              = ["sqlServer"]
    is_manual_connection           = false
  }
}

resource "azurerm_private_dns_zone" "bestrong_sql_dns" {
  name                = "privatelink.database.windows.net"
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "bestrong_sql_dns_vnet_link" {
  name                  = "bestrong-sql-vnet-link"
  resource_group_name   = data.azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.bestrong_sql_dns.name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

