# Generate a random storage name
resource "random_string" "tf-name" {
  length  = 8
  upper   = false
  number  = true
  lower   = true
  special = false
}

resource "azurerm_resource_group" "webapp-rg" {
  name     = "webapp-rg-${var.environment}-${random_string.tf-name.result}"
  location = var.location
}

# Provisions an Azure Container Registry.
resource "azurerm_container_registry" "acr" {
  name                = "registry${var.environment}${random_string.tf-name.result}"
  resource_group_name = azurerm_resource_group.webapp-rg.name
  location            = azurerm_resource_group.webapp-rg.location
  sku                 = var.tier
  admin_enabled       = true
  # todo you will want to add this on production env
  #  georeplication_locations = [var.location]
}

module "web_app_container" {
  source              = "innovationnorway/web-app-container/azurerm"
  name                = "docker-webapp-${var.environment}-${random_string.tf-name.result}"
  resource_group_name = azurerm_resource_group.webapp-rg.name

  docker_registry_url = "https://${azurerm_container_registry.acr.name}.azurecr.io"
}