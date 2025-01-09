output "app_url" {
  value = azurerm_app_service.service.default_site_hostname
}

output "api_management_url" {
  value = azurerm_api_management.api.gateway_url
}

