# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.40.0"
    }
  }
}
data "azurerm_subscription" "primary" {
}
data "azurerm_container_registry" "acr" {
  name                = var.azurerm_container_registry
  resource_group_name = var.resource_group_name
}

# create resource group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}
# create container registry
resource "azurerm_container_registry" "acr" {
  name                = var.azurerm_container_registry
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  sku                 = "Basic"
  admin_enabled       = true
  # identity {
  #   type = "SystemAssigned"
  # }
 
}
# resource "azurerm_role_definition" "customrole" {
#   name                = "my_custom_role"
#   scope = data.azurerm_subscription.primary.id
#   description = "This is a custom role created via Terraform"
#   permissions {
#     actions     = ["*"]
#     not_actions = []
#   }
  # assignable_scopes = [
  #   data.azurerm_subscription.primary.id, # /subscriptions/00000000-0000-0000-0000-000000000000
  # ]
# #}
# resource "azurerm_role_assignment" "app_servicecontainer_registry" {
#   #scope                = data.azurerm_subscription.primary.id
#   scope                = azurerm_app_service.containerapp.id
#   role_definition_name = "AcrPull"
#   #principal_id         = azurerm_app_service.containerapp.id
#   principal_id = "1401e71c-e119-4f22-b5a7-0ffe6c637315"
#   #principal_id = data.azurerm_subscription.primary.id
# }

# Create the Linux App Service Plan
resource "azurerm_app_service_plan" "appserviceplan" {
  name                = var.azurerm_service_plan_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  kind                = "linux"
  reserved            = true
  sku {
    tier = "Free"
    size = "F1"
  }
}

# Create the web app, pass in the App Service Plan ID
resource "azurerm_app_service" "containerapp" {
  name                  = var.azurerm_container_app_name
  location              = var.resource_group_location
  resource_group_name   = var.resource_group_name
  app_service_plan_id   = azurerm_app_service_plan.appserviceplan.id
  identity  {
    type = "SystemAssigned"
   }

  app_settings =  local.env_variables

#    WEBSITES_ENABLE_APP_SERVICE_STORAGE = false 

}
# Create the web app, pass in the App Service Plan ID

resource "azurerm_app_service" "containerback" {
  name                 = var.azurerm_backend_name
  resource_group_name   = var.resource_group_name
  location              = var.resource_group_location
  app_service_plan_id   = azurerm_app_service_plan.appserviceplan.id
  identity  {
    type = "SystemAssigned"
   }
   app_settings =  local.env_variables 
  
}