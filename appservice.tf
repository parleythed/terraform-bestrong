#appservice.tf - Configuration file for App Service and App Service Plan

resource "azurerm_app_service_plan" "bestrong_plan" {
  name                = "bestrong-app-plan"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "bestrong_app" {
  name                = var.azurerm_app_service_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.bestrong_plan.id
  identity {
    type = "SystemAssigned"
  }
  site_config {
    vnet_route_all_enabled = true
  }

  depends_on = [
    azurerm_virtual_network.vnet
  ]
}

resource "azurerm_app_service_virtual_network_swift_connection" "bestrong_app_vnet_integration" {
  app_service_id = azurerm_app_service.bestrong_app.id
  subnet_id      = azurerm_subnet.subnet.id
}