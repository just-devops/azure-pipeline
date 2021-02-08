# Define Terraform provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}


# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Provisions an Azure Container Registry.
resource "azurerm_container_registry" "acr" {
  name                = "demo-registry-${var.environment}-${random_string.tf-name.result}"
  resource_group_name = azurerm_resource_group.state-rg.name
  location            = azurerm_resource_group.state-rg.location
  sku                 = var.tier
  admin_enabled       = true
  # todo you will want to add this on production env
  #  georeplication_locations = [var.location]
}

module "web_app_container" {
  source              = "innovationnorway/web-app-container/azurerm"
  name                = "demo-docker-webapp-${var.environment}-${random_string.tf-name.result}"
  resource_group_name = azurerm_resource_group.state-rg.name

  docker_registry_url = "https://${azurerm_container_registry.acr.name}.azurecr.io"
}