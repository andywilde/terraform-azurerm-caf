terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
        }
    } 
}

provider "azurerm" {
    features {}
}


module "caf" {
  source  = "aztfmod/caf/azurerm"
  version = "~>5.5.0"
  # insert the 7 required variables here
  providers = {
        azurerm.vhub = azurerm
  }
  global_settings = var.global_settings
  resource_groups = var.resource_groups
  compute = {
    aks_clusters = var.aks_clusters
  }
  networking = {
    vnets                                = var.vnets
  }
}