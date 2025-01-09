resource "azurerm_virtual_network" "vnet" {
  name                = "bank-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_subnet" "backend1" {
  name                 = "backend1-subnet"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = var.rg_name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "backend2" {
  name                 = "backend2-subnet"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = var.rg_name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_security_group" "backend1_nsg" {
  name                = "backend1-nsg"
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_network_security_rule" "allow_bank_ip" {
  name                        = "AllowBankIP"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "203.0.113.0/24"
  network_security_group_name = azurerm_network_security_group.backend1_nsg.name
}

resource "azurerm_network_security_rule" "deny_internet" {
  name                        = "DenyInternet"
  priority                    = 200
  direction                   = "Outbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "Internet"
  network_security_group_name = azurerm_network_security_group.backend1_nsg.name
}

resource "azurerm_subnet_network_security_group_association" "backend1_nsg_association" {
  subnet_id                 = azurerm_subnet.backend1.id
  network_security_group_id = azurerm_network_security_group.backend1_nsg.id
