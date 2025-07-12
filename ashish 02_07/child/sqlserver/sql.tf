resource "azurerm_mssql_server" "mssql" {
  name                         = var.mssql_server_name
  resource_group_name          = var.rg_name
  location                     = var.rg_location
  version                      = "12.0"
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
}