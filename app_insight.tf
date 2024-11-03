resource "azurerm_application_insights" "bestrong_ai" {
  name                = "bestrong-app-insights"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  application_type    = "web"
}