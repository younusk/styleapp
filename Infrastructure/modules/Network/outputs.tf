output "VNETname" {
  value = azurerm_virtual_network.example.name
}

output "VNETid" {
  value = azurerm_virtual_network.example.id
}

output "subnetname" {
  value = azurerm_subnet.subnet1.name
}

output "subnetid" {
  value = azurerm_subnet.subnet1.id
}

output "subnetCIDR" {
  value = azurerm_subnet.subnet1.address_space
}

output "agwpipaddress" {
  value = azurerm_public_ip.AGWpip.ip_address
}
output "agwname" {
  value = azurerm_application_gateway.network.name
}

output "agwid" {
  value = azurerm_application_gateway.network.id
}