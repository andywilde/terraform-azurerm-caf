global_settings = {
  default_region = "region1"
  regions = {
    region1 = "uksouth"
  }
}

resource_groups = {
  aks_re1 = {
    name   = "aks-re1"
    region = "region1"
  }
}

aks_clusters = {
  cluster_re1 = {
    name               = "akscluster-re1-001"
    resource_group_key = "aks_re1"
    kubernetes_version = "1.23.8"
    os_type            = "Linux"
    private_cluster_enabled = true
    vnet_key = "spoke_aks_re1"


    identity = {
      type = "SystemAssigned"
    }


    network_profile = {
      network_plugin    = "azure"
      load_balancer_sku = "Standard"
    }


    # enable_rbac = true
    role_based_access_control = {
      enabled = true
      azure_active_directory = {
        managed = true
      }
    }

    # addon_profile = {
    #   oms_agent = {
    #     enabled           = true
    #     log_analytics_key = "central_logs_region1"
    #   }
    # }
    # admin_groups = {
    #   # ids = []
    #   # azuread_groups = {
    #   #   keys = []
    #   # }
    # }

    # load_balancer_profile = {
    #   # Only one option can be set
    #   managed_outbound_ip_count = 1
    # }

    default_node_pool = {
      name    = "sharedsvc"
      vm_size = "Standard_F4s_v2"
      # Standard_B2s
      #subnet_key            = "aks_nodepool_system"
      subnet = {
        key = "aks_nodepool_system"
        #resource_id = "/subscriptions/97958dac-xxxx-xxxx-xxxx-9f436fa73bd4/resourceGroups/qxgc-rg-aks-re1/providers/Microsoft.Network/virtualNetworks/qxgc-vnet-aks/subnets/qxgc-snet-aks_nodepool_system"
      }
      enable_auto_scaling  = true
      enable_node_public_ip = false
      max_pods              = 30
      node_count            = null
      min_count             = 1
      max_count             = 3
      # os_disk_type          = "Ephemeral"
      os_disk_size_gb       = 200
      orchestrator_version  = "1.23.8"
      tags = {
        "project" = "system services"
      }
    }

    node_resource_group_name = "aks-nodes-re1"

    addon_profile = {
      azure_keyvault_secrets_provider = {
        secret_rotation_enabled  = true
        secret_rotation_interval = "2m"
      }
    }

    auto_scaler_profile = {
      balance_similar_node_groups      = false
      expander                         = "random"
      max_graceful_termination_sec     = "600"
      new_pod_scale_up_delay           = "0s"
      scale_down_delay_after_add       = "10m"
      scale_down_delay_after_delete    = "10s"
      scale_down_delay_after_failure   = "3m"
      scale_down_unneeded              = "10m"
      scale_down_unready               = "20m"
      scale_down_utilization_threshold = "0.5"
      scan_interval                    = "10s"
      skip_nodes_with_local_storage    = false
    }
  }
}