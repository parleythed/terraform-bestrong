resource "azurerm_storage_account" "bestrong_storage" {
  name                     = var.azurerm_storage_account_name
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_private_endpoint" "bestrong_storage_private_endpoint" {
  name                = "bestrong-storage-private-endpoint"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  subnet_id           = azurerm_subnet.private_endpoint_subnet.id

  private_service_connection {
    name                           = "storagePrivateEndpointConnection"
    private_connection_resource_id = azurerm_storage_account.bestrong_storage.id
    subresource_names              = ["file"]
    is_manual_connection           = false
  }
}

resource "azurerm_private_dns_zone" "bestrong_storage_dns" {
  name                = "privatelink.file.core.windows.net"
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "bestrong_storage_dns_vnet_link" {
  name                  = "bestrong-storage-vnet-link"
  resource_group_name   = data.azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.bestrong_storage_dns.name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

resource "azurerm_storage_share" "bestrong_file_share" {
  name                 = "fileshare"
  storage_account_name = azurerm_storage_account.bestrong_storage.name
  quota                = 10
}