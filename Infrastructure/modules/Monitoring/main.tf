resource "azurerm_log_analytics_workspace" "example" {
  name                = "${var.projname}_law"
  location            = var.rgLocation
  resource_group_name = var.rgName
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_storage_account" "projectstorage" {
  name                     = "${var.projname}storage"
  resource_group_name      = var.rgName
  location                 = var.rgLocation
  account_tier             = "Standard"
  account_replication_type = "GRS"

}

resource "azurerm_data_factory" "projectadf" {
  name                = "${var.projname}_data"
  location            = var.rgLocation
  resource_group_name = var.rgName
}

resource "azurerm_monitor_diagnostic_setting" "example1" {
  name               = "example1"
  target_resource_id = azurerm_data_factory.projectadf.id
  storage_account_id = azurerm_storage_account.projectstorage.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.example.id
  log_analytics_destination_type = "Dedicated"
  
  enabled_log {
    category = "AuditEvent"
  }

  metric {
    category = "AllMetrics"
  }
}