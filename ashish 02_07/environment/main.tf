module "rg" {
  source = "../child/rg"
  rg_name     = "dada-rg"
  rg_location = "Central India"
  
}

module "rg4" {
  source = "../child/rg"
  rg_name     = "dada-rg4"
  rg_location = "Central India"
  
}

module "rg5" {
  source = "../child/rg"
  rg_name     = "dada-rg5"
  rg_location = "Central India"
  
}


module "rg2" {
  source = "../child/rg"
  rg_name     = "dada-rg2"
  rg_location = "Central India"
  
}



module "vnet" {
  depends_on = [ module.rg ]
  source = "../child/vnet"
  vnet_name     = "dada-vnet"
  rg_location   = "Central India"
  rg_name       = "dada-rg"
  address_space = ["10.0.0.0/16"]

}

module "subnet1" {
  depends_on = [ module.vnet ]
  source = "../child/subnet"
  subnet_name     = "dadafrontendsubnet"
  rg_name         = "dada-rg"
  vnet_name       = "dada-vnet"
  address_prefixes = ["10.0.1.0/24"]
} 

module "subnet2" {
  depends_on = [ module.vnet ]
  source = "../child/subnet"
  subnet_name     = "dadabackendsubnet"
  rg_name         = "dada-rg"
  vnet_name       = "dada-vnet"
  address_prefixes = ["10.0.2.0/24"]
}

module "mssql_server_name" {
  depends_on = [ module.rg ]
  source = "../child/sqlserver"
  mssql_server_name = "dadamssqlserver"
  rg_name           = "dada-rg"
  rg_location       = "Central India"
  administrator_login = "dadaadmin"
  administrator_login_password = "Partner20_25"
  
}

module "database" {
  depends_on = [ module.mssql_server_name ]
  source = "../child/database"
  mssql_database_name = "dadamssqldatabase"
  mssql_server_name   = "dadamssqlserver"
  rg_name             = "dada-rg"
  
}

module "pip1" {
  depends_on = [ module.rg ]
  source = "../child/pip"
  pip_name     = "dadapublicip1"
  rg_name      = "dada-rg"
  rg_location  = "Central India"
  
}

module "pip2" {
  depends_on = [ module.rg ]
  source = "../child/pip"
  pip_name     = "dadapublicip2"
  rg_name      = "dada-rg"
  rg_location  = "Central India"
  
}



module "vm1" {
  depends_on = [ module.subnet1, module.rg, module.kv , module.rg2,]
  source = "../child/vm"
  vm_name          = "dadavm1"
  rg_name          = "dada-rg"
  rg_location      = "Central India"
  vnet_name        = "dada-vnet"
  subnet_name      = "dadafrontendsubnet"
  pip_name         = "dadapublicip1"
  nic              = "dadanic1"
  vm_size          = "Standard_B1s"
  # admin_username   = "dadaadmin1"
  # admin_password   = "Partner20_25"
  image_publisher  = "Canonical"
  image_offer      = "0001-com-ubuntu-server-jammy"
  image_sku        = "22_04-lts-gen2"
  image_version    = "latest"
  install_nginx    = true

}


# module "vm2" {
#   depends_on = [ module.subnet2, module.rg ]
#   source = "../child/vm"
#   vm_name          = "dadavm2"
#   rg_name          = "dada-rg"
#   rg_location      = "Central India"
#   vnet_name        = "dada-vnet"
#   subnet_name      = "dadabackendsubnet"
#   pip_name         = "dadapublicip2"
#   nic              = "dadanic2"
#   vm_size          = "Standard_B1s"
#   admin_username   = "dadaadmin2"
#   admin_password   = "Partner20_25"
#   image_publisher  = "Canonical"
#   image_offer      = "0001-com-ubuntu-server-focal"
#   image_sku        = "20_04-lts"
#   image_version    = "latest"
# install_nginx = false

# }


module "kv" {
  depends_on = [ module.rg2 ]
  source = "./kv.tf"
  kv_name     = "dadakv"
  rg_name     = "dada-rg2"
  rg_location = "Central India"
}
