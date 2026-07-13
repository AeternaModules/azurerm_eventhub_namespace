variable "eventhub_namespaces" {
  description = <<EOT
Map of eventhub_namespaces, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku
Optional:
    - auto_inflate_enabled
    - capacity
    - dedicated_cluster_id
    - local_authentication_enabled
    - maximum_throughput_units
    - minimum_tls_version
    - public_network_access_enabled
    - tags
    - identity (block):
        - identity_ids (optional)
        - type (required)
    - network_rulesets (block):
        - default_action (optional)
        - ip_rule (optional, block):
            - action (optional)
            - ip_mask (optional)
        - public_network_access_enabled (optional)
        - trusted_service_access_enabled (optional)
        - virtual_network_rule (optional, block):
            - ignore_missing_virtual_network_service_endpoint (optional)
            - subnet_id (optional)
EOT

  type = map(object({
    location                      = string
    name                          = string
    resource_group_name           = string
    sku                           = string
    auto_inflate_enabled          = optional(bool)
    capacity                      = optional(number)
    dedicated_cluster_id          = optional(string)
    local_authentication_enabled  = optional(bool)
    maximum_throughput_units      = optional(number)
    minimum_tls_version           = optional(string)
    public_network_access_enabled = optional(bool)
    tags                          = optional(map(string))
    identity = optional(object({
      identity_ids = optional(set(string))
      type         = string
    }))
    network_rulesets = optional(list(object({
      default_action = optional(string)
      ip_rule = optional(list(object({
        action  = optional(string)
        ip_mask = optional(string)
      })))
      public_network_access_enabled  = optional(bool)
      trusted_service_access_enabled = optional(bool)
      virtual_network_rule = optional(list(object({
        ignore_missing_virtual_network_service_endpoint = optional(bool)
        subnet_id                                       = optional(string)
      })))
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.eventhub_namespaces : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.eventhub_namespaces : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.eventhub_namespaces : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.eventhub_namespaces : (
        v.maximum_throughput_units == null || (v.maximum_throughput_units >= 0 && v.maximum_throughput_units <= 40)
      )
    ])
    error_message = "must be between 0 and 40"
  }
  validation {
    condition = alltrue([
      for k, v in var.eventhub_namespaces : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 17 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

