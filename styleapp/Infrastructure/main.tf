resource "azurerm_resource_group" "example" {
  name     = var.rgName
  location = var.rgLocation
}

module "Network" {
  source = "./modules/Network"
  rgName = azurerm_resource_group.example.name
  rgLocation = azurerm_resource_group.example.location
  projname = var.projname
}

module "K8s_cluster" {
  source = "./modules/AKS"
  rgName = azurerm_resource_group.example.name
  rgLocation = azurerm_resource_group.example.location
  projname = var.projname
  VNETname = module.Network.VNETname
  gateway_id = module.Network.agwid
  gateway_name = module.Network.agwname
  subnet_cidr = module.Network.subnetCIDR
  subnet_id = module.Network.subnetid
}

module "Monitoring" {
  source = "./modules/Monitoring"
  rgName = azurerm_resource_group.example.name
  rgLocation = azurerm_resource_group.example.location
  projname = var.projname
}

module "Function App" {
  source = "./modules/AFN"
  rgName = azurerm_resource_group.example.name
  rgLocation = azurerm_resource_group.example.location
  projname = var.projname
storageacct = module.Monitoring.storageacctname
storagekey = module.Monitoring.storagekey
storageid = module.Monitoring.storageid
}