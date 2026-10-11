resource "google_clouddeploy_automation" "clouddeploy_automations" {
  for_each = var.clouddeploy_automations

  delivery_pipeline = each.value.delivery_pipeline
  location          = each.value.location
  name              = each.value.name
  service_account   = each.value.service_account
  annotations       = each.value.annotations
  deletion_policy   = each.value.deletion_policy
  description       = each.value.description
  labels            = each.value.labels
  project           = each.value.project
  suspended         = each.value.suspended

  dynamic "rules" {
    for_each = each.value.rules
    content {
      dynamic "advance_rollout_rule" {
        for_each = rules.value.advance_rollout_rule != null ? [rules.value.advance_rollout_rule] : []
        content {
          id            = advance_rollout_rule.value.id
          source_phases = advance_rollout_rule.value.source_phases
          wait          = advance_rollout_rule.value.wait
        }
      }
      dynamic "promote_release_rule" {
        for_each = rules.value.promote_release_rule != null ? [rules.value.promote_release_rule] : []
        content {
          destination_phase     = promote_release_rule.value.destination_phase
          destination_target_id = promote_release_rule.value.destination_target_id
          id                    = promote_release_rule.value.id
          wait                  = promote_release_rule.value.wait
        }
      }
      dynamic "repair_rollout_rule" {
        for_each = rules.value.repair_rollout_rule != null ? [rules.value.repair_rollout_rule] : []
        content {
          id     = repair_rollout_rule.value.id
          jobs   = repair_rollout_rule.value.jobs
          phases = repair_rollout_rule.value.phases
          dynamic "repair_phases" {
            for_each = repair_rollout_rule.value.repair_phases != null ? repair_rollout_rule.value.repair_phases : []
            content {
              dynamic "retry" {
                for_each = repair_phases.value.retry != null ? [repair_phases.value.retry] : []
                content {
                  attempts     = retry.value.attempts
                  backoff_mode = retry.value.backoff_mode
                  wait         = retry.value.wait
                }
              }
              dynamic "rollback" {
                for_each = repair_phases.value.rollback != null ? [repair_phases.value.rollback] : []
                content {
                  destination_phase                   = rollback.value.destination_phase
                  disable_rollback_if_rollout_pending = rollback.value.disable_rollback_if_rollout_pending
                }
              }
            }
          }
        }
      }
      dynamic "timed_promote_release_rule" {
        for_each = rules.value.timed_promote_release_rule != null ? [rules.value.timed_promote_release_rule] : []
        content {
          destination_phase     = timed_promote_release_rule.value.destination_phase
          destination_target_id = timed_promote_release_rule.value.destination_target_id
          id                    = timed_promote_release_rule.value.id
          schedule              = timed_promote_release_rule.value.schedule
          time_zone             = timed_promote_release_rule.value.time_zone
        }
      }
    }
  }

  selector {
    dynamic "targets" {
      for_each = each.value.selector.targets
      content {
        id     = targets.value.id
        labels = targets.value.labels
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

