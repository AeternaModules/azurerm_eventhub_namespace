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
        - default_action (required)
        - ip_rule (optional, block):
            - action (optional)
            - ip_mask (required)
        - public_network_access_enabled (optional)
        - trusted_service_access_enabled (optional)
        - virtual_network_rule (optional, block):
            - ignore_missing_virtual_network_service_endpoint (optional)
            - subnet_id (required)
EOT

  type = map(object({
    location                      = string
    name                          = string
    resource_group_name           = string
    sku                           = string
    auto_inflate_enabled          = optional(bool)   # Default: false
    capacity                      = optional(number) # Default: 1
    dedicated_cluster_id          = optional(string)
    local_authentication_enabled  = optional(bool) # Default: true
    maximum_throughput_units      = optional(number)
    minimum_tls_version           = optional(string) # Default: "1.2"
    public_network_access_enabled = optional(bool)   # Default: true
    tags                          = optional(map(string))
    identity = optional(object({
      identity_ids = optional(set(string))
      type         = string
    }))
    network_rulesets = optional(object({
      default_action = string
      ip_rule = optional(object({
        action  = optional(string) # Default: "Allow"
        ip_mask = string
      }))
      public_network_access_enabled  = optional(bool) # Default: true
      trusted_service_access_enabled = optional(bool)
      virtual_network_rule = optional(object({
        ignore_missing_virtual_network_service_endpoint = optional(bool)
        subnet_id                                       = string
      }))
    }))
  }))
}

