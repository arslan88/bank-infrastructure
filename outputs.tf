output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "backend1_url" {
  value = module.backend1.app_url
}

output "backend2_url" {
  value = module.backend2.app_url
}

