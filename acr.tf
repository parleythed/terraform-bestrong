resource "azurerm_container_registry" "bestrong_acr" {
  name                = var.azurerm_container_registry_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = true
}

resource "azurerm_role_assignment" "acr_pull_permission" {
  scope                = azurerm_container_registry.bestrong_acr.id
  role_definition_name = "Owner"
  principal_id         = azurerm_app_service.bestrong_app.identity[0].principal_id
}