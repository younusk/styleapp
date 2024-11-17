output "storageblobid" {
  value = azurerm_storage_blob.example.id
}

output "projectaspid" {
  value = azurerm_service_plan.example.id
}

output "functionappid" {
  value = azurerm_linux_function_app.example.id
}