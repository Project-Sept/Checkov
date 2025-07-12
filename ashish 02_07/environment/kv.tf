data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "keyvault" {
  name                        = var.kv_name
  location                    = var.rg_location
  resource_group_name         = var.rg_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}


data "azurerm_key_vault" "keyvault1" {
  name                = "dadakv"
  resource_group_name = "dada-rg2"
}

resource "azurerm_key_vault_secret" "kvsecret" {
  name         = "frontendvmkausername"
  value        = "dadaadmin1"
  key_vault_id = data.azurerm_key_vault.keyvault1.id
}



resource "azurerm_key_vault_secret" "kvsecret1" {
  name         = "frontendvmkapassword"
  value        = "Partner20_25"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}