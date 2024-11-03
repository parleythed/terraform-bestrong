terraform {
  required_version = "1.9.8"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.116.0"
    }
  }
}

provider "azurerm" {
  features {
  resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }
}

data "azurerm_resource_group" "rg" {
  name = var.azurerm_resource_group_name
}

#resource "azurerm_resource_group" "rg" {
#  name     = var.azurerm_resource_group_name
#  location = var.azurerm_resource_group_location
#}


