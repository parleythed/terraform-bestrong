variable "azurerm_resource_group_name" {
  description = "Resource group's name in Azure"
  type        = string
  default     = "BeStrongApplication"
}

variable "azurerm_resource_group_location" {
  description = "Resource group's location in Azure"
  type        = string
  default     = "Canada Central"
}

variable "azurerm_virtual_network_name" {
  description = "Virtual network's name for BeStrongApplication in Azure"
  type        = string
  default     = "BestrongAppNetwork"
}

variable "azurerm_subnet_name" {
  description = "Subnet's name for BeStrongApplication in Azure"
  type        = string
  default     = "BestrongAppSubnet"
}

variable "azurerm_app_service_name" {
  description = "Name for App Service"
  type        = string
  default     = "BeStrongAppService11"
}

variable "azurerm_container_registry_name" {
  description = "Name for ARC"
  type        = string
  default     = "bestrongcontainer"
}

variable "tenant_id" {
  description = "Azure Account Tenant ID"
  type        = string
  sensitive   = true
}

variable "azurerm_storage_account_name" {
  description = "Name for storage account"
  type        = string
  default     = "tfbestrongstorage"
}

variable "sql_adminstrator_login" {
  description = "Login for SQL"
  type        = string
  sensitive   = true
}

variable "sql_adminstrator_login_password" {
  description = "Password for SQL"
  type        = string
  sensitive   = true
} 

variable "azurerm_storage_account_name_tfstate" {
  description = "Name for storage account"
  type        = string
  default     = "prtfstatestacc"
}
