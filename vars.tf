variable "resource_group_name" {
  description = "define resource group Name"
  type        = string
  default     = "rg-develop"
}
variable "resource_group_location" {
  description = "define resource group location"
  type        = string
  default     = "Central US"
}
variable "azurerm_container_registry" {
  description = "define container registry name"
  type        = string
  default     = "developtestrepository"
 
}
variable "azurerm_service_plan_name" {
  description = " Define service Plan Name"
  type        = string
  default =  "Teraform-service-plan"
}
variable "azurerm_container_app_name" {
  description = " Define service Plan Name"
  type        = string
  default = "terraformDclickfdevTest"
}
variable "azurerm_backend_name" {
  description = " Define backend app Name"
  type = string
  default= "DclickVisitorService" 
}
locals {
  env_variables = { 
    # Settings for private Container Registires  
    DOCKER_REGISTRY_SERVER_URL      = ""
    DOCKER_REGISTRY_SERVER_USERNAME = ""
    DOCKER_REGISTRY_SERVER_PASSWORD = ""
  } 
}
