resource "azurerm_container_registry" "acr" {
  name                = "${var.projname}_acr"
  resource_group_name = var.rgName
  location            = var.rgLocation
  sku                 = "Premium"
  admin_enabled       = false
  georeplications {
    location                = "East US"
    zone_redundancy_enabled = true
    tags = {
      CreatedBY = "Kay"
    }
  }
}

resource "azurerm_kubernetes_cluster" "example" {
  name                = "${var.projname}-aks1"
  location            = var.rgLocation
  resource_group_name = var.rgName
  dns_prefix          = "${var.projname}aks1"
  node_resource_group = var.rgName

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    CreatedBY = "Kay"
  }

  workload_autoscaler_profile {
    vertical_pod_autoscaler_enabled = true
  }

  ingress_application_gateway {
    gateway_id   = var.gateway_id
    gateway_name = var.gateway_name
    subnet_cidr  = var.subnet_cidr
    subnet_id    = var.subnet_id
  }
}

