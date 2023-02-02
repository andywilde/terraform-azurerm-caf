variable aks_clusters {
  default = {}
}
variable global_settings {
  default = {
    default_region = "region1"
    regions = {
      region1 = "uksouth"
    }
  }
}
variable resource_groups {
  default = null
}
variable vnets {
  default = {}
}