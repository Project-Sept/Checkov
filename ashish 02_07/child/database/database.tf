resource "azurerm_mssql_database" "database" {
  name         = var.mssql_database_name
  server_id    = data.azurerm_mssql_server.dataserver.id
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"


  }

  data "azurerm_mssql_server" "dataserver" {
  name                  = var.mssql_server_name
  resource_group_name   = var.rg_name
}