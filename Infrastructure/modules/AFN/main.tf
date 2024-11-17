resource "azurerm_storage_blob" "example" {
  name                   = "azfunction.zip"
  storage_account_name   = var.storageacct
  storage_container_name = azurerm_storage_account.example.default_blob_container_name
  type                   = "Block"
  source                 = "./code.zip"
}


resource "azurerm_storage_container" "fxncontainer" {
  name                  = "azfunctioncontainer"
  storage_account_id    = var.storageid
  container_access_type = "container"
}

resource "azurerm_service_plan" "example" {
  name                = "${var.projname}_asp"
  resource_group_name = var.rgName
  location            = var.rgLocation
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_function_app" "example" {
  name                = "projectfunctionapp"
  resource_group_name = var.rgName
  location            = var.rgLocation
  storage_account_name       = var.storageacct
  storage_account_access_key = var.storagekey
  service_plan_id            = azurerm_service_plan.example.id
  app_settings = {
    FUNCTIONS_WORKER_RUNTIME = "python"
    WEBSITE_RUN_FROM_PACKAGE = "1" # Ensures the function code runs from a package file
    
  }

  site_config {
    always_on = true
    linux_fx_version = "PYTHON|3.11"
  }

}