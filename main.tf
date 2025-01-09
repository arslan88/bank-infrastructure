provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "bank-infra-rg"
  location = var.location
}

module "network" {
  source   = "./modules/network"
  rg_name  = azurerm_resource_group.rg.name
  location = var.location
}

module "backend1" {
  source   = "./modules/backend_service"
  name     = "backend1"
  rg_name  = azurerm_resource_group.rg.name
  subnet_id = module.network.backend1_subnet_id
  location = var.location
}

module "backend2" {
  source   = "./modules/backend_service"
  name     = "backend2"
  rg_name  = azurerm_resource_group.rg.name
  subnet_id = module.network.backend2_subnet_id
  location = var.location
}

module "react_app" {
  source   = "./modules/react_app"
  rg_name  = azurerm_resource_group.rg.name
  location = var.location
}

