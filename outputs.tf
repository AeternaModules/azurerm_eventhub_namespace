output "eventhub_namespaces_id" {
  description = "Map of id values across all eventhub_namespaces, keyed the same as var.eventhub_namespaces"
  value       = { for k, v in azurerm_eventhub_namespace.eventhub_namespaces : k => v.id if v.id != null && length(v.id) > 0 }
}
output "eventhub_namespaces_auto_inflate_enabled" {
  description = "Map of auto_inflate_enabled values across all eventhub_namespaces, keyed the same as var.eventhub_namespaces"
  value       = { for k, v in azurerm_eventhub_namespace.eventhub_namespaces : k => v.auto_inflate_enabled if v.auto_inflate_enabled != null }
}
output "eventhub_namespaces_capacity" {
  description = "Map of capacity values across all eventhub_namespaces, keyed the same as var.eventhub_namespaces"
  value       = { for k, v in azurerm_eventhub_namespace.eventhub_namespaces : k => v.capacity if v.capacity != null }
}
output "eventhub_namespaces_dedicated_cluster_id" {
  description = "Map of dedicated_cluster_id values across all eventhub_namespaces, keyed the same as var.eventhub_namespaces"
  value       = { for k, v in azurerm_eventhub_namespace.eventhub_namespaces : k => v.dedicated_cluster_id if v.dedicated_cluster_id != null && length(v.dedicated_cluster_id) > 0 }
}
output "eventhub_namespaces_default_primary_connection_string" {
  description = "Map of default_primary_connection_string values across all eventhub_namespaces, keyed the same as var.eventhub_namespaces"
  value       = { for k, v in azurerm_eventhub_namespace.eventhub_namespaces : k => v.default_primary_connection_string if v.default_primary_connection_string != null && length(v.default_primary_connection_string) > 0 }
  sensitive   = true
}
output "eventhub_namespaces_default_primary_connection_string_alias" {
  description = "Map of default_primary_connection_string_alias values across all eventhub_namespaces, keyed the same as var.eventhub_namespaces"
  value       = { for k, v in azurerm_eventhub_namespace.eventhub_namespaces : k => v.default_primary_connection_string_alias if v.default_primary_connection_string_alias != null && length(v.default_primary_connection_string_alias) > 0 }
  sensitive   = true
}
output "eventhub_namespaces_default_primary_key" {
  description = "Map of default_primary_key values across all eventhub_namespaces, keyed the same as var.eventhub_namespaces"
  value       = { for k, v in azurerm_eventhub_namespace.eventhub_namespaces : k => v.default_primary_key if v.default_primary_key != null && length(v.default_primary_key) > 0 }
  sensitive   = true
}
output "eventhub_namespaces_default_secondary_connection_string" {
  description = "Map of default_secondary_connection_string values across all eventhub_namespaces, keyed the same as var.eventhub_namespaces"
  value       = { for k, v in azurerm_eventhub_namespace.eventhub_namespaces : k => v.default_secondary_connection_string if v.default_secondary_connection_string != null && length(v.default_secondary_connection_string) > 0 }
  sensitive   = true
}
output "eventhub_namespaces_default_secondary_connection_string_alias" {
  description = "Map of default_secondary_connection_string_alias values across all eventhub_namespaces, keyed the same as var.eventhub_namespaces"
  value       = { for k, v in azurerm_eventhub_namespace.eventhub_namespaces : k => v.default_secondary_connection_string_alias if v.default_secondary_connection_string_alias != null && length(v.default_secondary_connection_string_alias) > 0 }
  sensitive   = true
}
output "eventhub_namespaces_default_secondary_key" {
  description = "Map of default_secondary_key values across all eventhub_namespaces, keyed the same as var.eventhub_namespaces"
  value       = { for k, v in azurerm_eventhub_namespace.eventhub_namespaces : k => v.default_secondary_key if v.default_secondary_key != null && length(v.default_secondary_key) > 0 }
  sensitive   = true
}
output "eventhub_namespaces_identity" {
  description = "Map of identity values across all eventhub_namespaces, keyed the same as var.eventhub_namespaces"
  value       = { for k, v in azurerm_eventhub_namespace.eventhub_namespaces : k => v.identity if v.identity != null && length(v.identity) > 0 }
}
output "eventhub_namespaces_local_authentication_enabled" {
  description = "Map of local_authentication_enabled values across all eventhub_namespaces, keyed the same as var.eventhub_namespaces"
  value       = { for k, v in azurerm_eventhub_namespace.eventhub_namespaces : k => v.local_authentication_enabled if v.local_authentication_enabled != null }
}
output "eventhub_namespaces_location" {
  description = "Map of location values across all eventhub_namespaces, keyed the same as var.eventhub_namespaces"
  value       = { for k, v in azurerm_eventhub_namespace.eventhub_namespaces : k => v.location if v.location != null && length(v.location) > 0 }
}
output "eventhub_namespaces_maximum_throughput_units" {
  description = "Map of maximum_throughput_units values across all eventhub_namespaces, keyed the same as var.eventhub_namespaces"
  value       = { for k, v in azurerm_eventhub_namespace.eventhub_namespaces : k => v.maximum_throughput_units if v.maximum_throughput_units != null }
}
output "eventhub_namespaces_minimum_tls_version" {
  description = "Map of minimum_tls_version values across all eventhub_namespaces, keyed the same as var.eventhub_namespaces"
  value       = { for k, v in azurerm_eventhub_namespace.eventhub_namespaces : k => v.minimum_tls_version if v.minimum_tls_version != null && length(v.minimum_tls_version) > 0 }
}
output "eventhub_namespaces_name" {
  description = "Map of name values across all eventhub_namespaces, keyed the same as var.eventhub_namespaces"
  value       = { for k, v in azurerm_eventhub_namespace.eventhub_namespaces : k => v.name if v.name != null && length(v.name) > 0 }
}
output "eventhub_namespaces_network_rulesets" {
  description = "Map of network_rulesets values across all eventhub_namespaces, keyed the same as var.eventhub_namespaces"
  value       = { for k, v in azurerm_eventhub_namespace.eventhub_namespaces : k => v.network_rulesets if v.network_rulesets != null && length(v.network_rulesets) > 0 }
}
output "eventhub_namespaces_public_network_access_enabled" {
  description = "Map of public_network_access_enabled values across all eventhub_namespaces, keyed the same as var.eventhub_namespaces"
  value       = { for k, v in azurerm_eventhub_namespace.eventhub_namespaces : k => v.public_network_access_enabled if v.public_network_access_enabled != null }
}
output "eventhub_namespaces_resource_group_name" {
  description = "Map of resource_group_name values across all eventhub_namespaces, keyed the same as var.eventhub_namespaces"
  value       = { for k, v in azurerm_eventhub_namespace.eventhub_namespaces : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "eventhub_namespaces_sku" {
  description = "Map of sku values across all eventhub_namespaces, keyed the same as var.eventhub_namespaces"
  value       = { for k, v in azurerm_eventhub_namespace.eventhub_namespaces : k => v.sku if v.sku != null && length(v.sku) > 0 }
}
output "eventhub_namespaces_tags" {
  description = "Map of tags values across all eventhub_namespaces, keyed the same as var.eventhub_namespaces"
  value       = { for k, v in azurerm_eventhub_namespace.eventhub_namespaces : k => v.tags if v.tags != null && length(v.tags) > 0 }
}

