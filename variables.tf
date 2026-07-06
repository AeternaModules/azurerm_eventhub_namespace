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
  validation {
    condition = alltrue([
      for k, v in var.eventhub_namespaces : (
        v.maximum_throughput_units == null || (v.maximum_throughput_units >= 0 && v.maximum_throughput_units <= 40)
      )
    ])
    error_message = "must be between 0 and 40"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_eventhub_namespace's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    validate.ValidateEventHubNamespaceName: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: sku
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: dedicated_cluster_id
  #   source:    [from eventhubsclusters.ValidateClusterID] !ok
  # path: dedicated_cluster_id
  #   source:    [from eventhubsclusters.ValidateClusterID] err != nil
  # path: identity.type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: identity.identity_ids[*]
  #   source:    [from commonids.ValidateUserAssignedIdentityID] !ok
  # path: identity.identity_ids[*]
  #   source:    [from commonids.ValidateUserAssignedIdentityID] err != nil
  # path: network_rulesets.default_action
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: network_rulesets.virtual_network_rule.subnet_id
  #   source:    [from commonids.ValidateSubnetID] !ok
  # path: network_rulesets.virtual_network_rule.subnet_id
  #   source:    [from commonids.ValidateSubnetID] err != nil
  # path: network_rulesets.ip_rule.action
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: minimum_tls_version
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

