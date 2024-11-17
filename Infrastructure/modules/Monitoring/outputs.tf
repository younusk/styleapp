output "storageacctname" {
  value = azurerm_storage_account.projectstorage.name
}

output "storagekey" {
  value = azurerm_storage_account.projectstorage.primary_access_key
}

output "storageid" {
  value = azurerm_storage_account.projectstorage.id
}

output "projectlaw" {
  value = azurerm_log_analytics_workspace.example
}

output "projectdatafactory" {
  value = azurerm_data_factory.projectadf
}