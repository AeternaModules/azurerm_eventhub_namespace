resource "azurerm_eventhub_namespace" "eventhub_namespaces" {
  for_each = var.eventhub_namespaces

  location                      = each.value.location
  name                          = each.value.name
  resource_group_name           = each.value.resource_group_name
  sku                           = each.value.sku
  auto_inflate_enabled          = each.value.auto_inflate_enabled
  capacity                      = each.value.capacity
  dedicated_cluster_id          = each.value.dedicated_cluster_id
  local_authentication_enabled  = each.value.local_authentication_enabled
  maximum_throughput_units      = each.value.maximum_throughput_units
  minimum_tls_version           = each.value.minimum_tls_version
  public_network_access_enabled = each.value.public_network_access_enabled
  tags                          = each.value.tags

  dynamic "identity" {
    for_each = each.value.identity != null ? [each.value.identity] : []
    content {
      identity_ids = identity.value.identity_ids
      type         = identity.value.type
    }
  }

  dynamic "network_rulesets" {
    for_each = each.value.network_rulesets != null ? [each.value.network_rulesets] : []
    content {
      default_action = network_rulesets.value.default_action
      dynamic "ip_rule" {
        for_each = network_rulesets.value.ip_rule != null ? network_rulesets.value.ip_rule : []
        content {
          action  = ip_rule.value.action
          ip_mask = ip_rule.value.ip_mask
        }
      }
      public_network_access_enabled  = network_rulesets.value.public_network_access_enabled
      trusted_service_access_enabled = network_rulesets.value.trusted_service_access_enabled
      dynamic "virtual_network_rule" {
        for_each = network_rulesets.value.virtual_network_rule != null ? network_rulesets.value.virtual_network_rule : []
        content {
          ignore_missing_virtual_network_service_endpoint = virtual_network_rule.value.ignore_missing_virtual_network_service_endpoint
          subnet_id                                       = virtual_network_rule.value.subnet_id
        }
      }
    }
  }
}

