terraform {
  backend "azurerm" {
    resource_group_name  = "BeStrongApplication"
    storage_account_name  = "prtfstatestacc"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}
