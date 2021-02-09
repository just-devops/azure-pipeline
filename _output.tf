output "AZURE_APP_SERVICE_NAME" {
  value = module.web_app_container.name
}

output "AZURE_CONTAINER_REGISTRY" {
  value = "${azurerm_container_registry.acr.name}.azurecr.io"
}