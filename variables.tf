variable "clouddeploy_automations" {
  description = <<EOT
Map of clouddeploy_automations, attributes below
Required:
    - delivery_pipeline
    - location
    - name
    - service_account
    - rules (block):
        - advance_rollout_rule (optional, block):
            - id (required)
            - source_phases (optional)
            - wait (optional)
        - promote_release_rule (optional, block):
            - destination_phase (optional)
            - destination_target_id (optional)
            - id (required)
            - wait (optional)
        - repair_rollout_rule (optional, block):
            - id (required)
            - jobs (optional)
            - phases (optional)
            - repair_phases (optional, block):
                - retry (optional, block):
                    - attempts (required)
                    - backoff_mode (optional)
                    - wait (optional)
                - rollback (optional, block):
                    - destination_phase (optional)
                    - disable_rollback_if_rollout_pending (optional)
        - timed_promote_release_rule (optional, block):
            - destination_phase (optional)
            - destination_target_id (optional)
            - id (required)
            - schedule (required)
            - time_zone (required)
    - selector (block):
        - targets (required, block):
            - id (optional)
            - labels (optional)
Optional:
    - annotations
    - deletion_policy
    - description
    - labels
    - project
    - suspended
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    delivery_pipeline = string
    location          = string
    name              = string
    service_account   = string
    annotations       = optional(map(string))
    deletion_policy   = optional(string)
    description       = optional(string)
    labels            = optional(map(string))
    project           = optional(string)
    suspended         = optional(bool)
    rules = list(object({
      advance_rollout_rule = optional(object({
        id            = string
        source_phases = optional(list(string))
        wait          = optional(string)
      }))
      promote_release_rule = optional(object({
        destination_phase     = optional(string)
        destination_target_id = optional(string)
        id                    = string
        wait                  = optional(string)
      }))
      repair_rollout_rule = optional(object({
        id     = string
        jobs   = optional(list(string))
        phases = optional(list(string))
        repair_phases = optional(list(object({
          retry = optional(object({
            attempts     = string
            backoff_mode = optional(string)
            wait         = optional(string)
          }))
          rollback = optional(object({
            destination_phase                   = optional(string)
            disable_rollback_if_rollout_pending = optional(bool)
          }))
        })))
      }))
      timed_promote_release_rule = optional(object({
        destination_phase     = optional(string)
        destination_target_id = optional(string)
        id                    = string
        schedule              = string
        time_zone             = string
      }))
    }))
    selector = object({
      targets = list(object({
        id     = optional(string)
        labels = optional(map(string))
      }))
    })
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.clouddeploy_automations : (
        length(v.rules) >= 1
      )
    ])
    error_message = "Each rules list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.clouddeploy_automations : (
        length(v.selector.targets) >= 1
      )
    ])
    error_message = "Each targets list must contain at least 1 items"
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

