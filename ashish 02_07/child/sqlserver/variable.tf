variable "mssql_server_name" {
  description = "The name of the SQL Server"
  type        = string
  
}

variable "rg_name" {
  description = "The name of the resource group"
  type        = string

}

variable "rg_location" {
  description = "The location of the resource"
  type        = string

}

variable "administrator_login" {
  description = "The administrator login for the SQL Server"
  type        = string
  
}

variable "administrator_login_password" {
  description = "The administrator login password for the SQL Server"
  type        = string

}