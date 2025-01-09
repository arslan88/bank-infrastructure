resource "azurerm_app_service_plan" "plan" {
  name                = "${var.name}-plan"
  location            = var.location
  resource_group_name = var.rg_name
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "service" {
  name                = "${var.name}-service"
  location            = var.location
  resource_group_name = var.rg_name
  app_service_plan_id = azurerm_app_service_plan.plan.id
}

# Azure API Management Configuration
resource "azurerm_api_management" "api" {
  name                = "${var.name}-api-management"
  location            = var.location
  resource_group_name = var.rg_name
  publisher_name      = "PublisherName"
  publisher_email     = "publisher@example.com"
  sku_name            = "Developer_1"
}

resource "azurerm_api_management_api" "api" {
  name                = "${var.name}-api"
  resource_group_name = var.rg_name
  api_management_name = azurerm_api_management.api.name
  revision            = "1"
  display_name        = "${var.name} API"
  path                = "backend2"
  protocols           = ["https"]
}

resource "azurerm_api_management_api_policy" "rate_limit_policy" {
  api_name            = azurerm_api_management_api.api.name
  resource_group_name = var.rg_name
  api_management_name = azurerm_api_management.api.name

  xml_content = <<XML
    <policies>
      <inbound>
        <base />
        <rate-limit-by-key calls="10" renewal-period="1" counter-key="@(context.Request.IpAddress)" />
      </inbound>
      <backend>
        <base />
      </backend>
      <outbound>
        <base />
      </outbound>
    </policies>
  XML
}
# Database Setup for Backend Services
resource "azurerm_mysql_server" "mysql" {
  name                = "${var.name}-mysql"
  location            = var.location
  resource_group_name = var.rg_name
  administrator_login = "mysqladmin"
  administrator_login_password = var.db_password
  sku_name            = "B_Gen5_1"
  storage_mb          = 5120
  version             = "5.7"
}

resource "azurerm_mysql_database" "database" {
  name                = "${var.name}_db"
  resource_group_name = var.rg_name
  server_name         = azurerm_mysql_server.mysql.name
  charset             = "utf8"
  collation           = "utf8_general_ci"
}
