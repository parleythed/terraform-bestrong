resource "azurerm_key_vault" "bestrong_kv" {
  name                = "bestrong-kv"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  tenant_id           = var.tenant_id
  sku_name            = "standard"
  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    virtual_network_subnet_ids = [azurerm_subnet.subnet.id]
  }
}

resource "azurerm_key_vault_access_policy" "bestrong_kv_policy" {
  key_vault_id = azurerm_key_vault.bestrong_kv.id
  tenant_id    = var.tenant_id
  object_id    = azurerm_app_service.bestrong_app.identity[0].principal_id

  secret_permissions      = ["Get", "List"]
  certificate_permissions = ["Get", "List"]
}

