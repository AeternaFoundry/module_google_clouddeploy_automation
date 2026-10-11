output "clouddeploy_automations_id" {
  description = "Map of id values across all clouddeploy_automations, keyed the same as var.clouddeploy_automations except keys with no id are omitted"
  value       = { for k, v in google_clouddeploy_automation.clouddeploy_automations : k => v.id if v.id != null && length(v.id) > 0 }
}
output "clouddeploy_automations_annotations" {
  description = "Map of annotations values across all clouddeploy_automations, keyed the same as var.clouddeploy_automations except keys with no annotations are omitted"
  value       = { for k, v in google_clouddeploy_automation.clouddeploy_automations : k => v.annotations if v.annotations != null && length(v.annotations) > 0 }
}
output "clouddeploy_automations_create_time" {
  description = "Map of create_time values across all clouddeploy_automations, keyed the same as var.clouddeploy_automations except keys with no create_time are omitted"
  value       = { for k, v in google_clouddeploy_automation.clouddeploy_automations : k => v.create_time if v.create_time != null && length(v.create_time) > 0 }
}
output "clouddeploy_automations_deletion_policy" {
  description = "Map of deletion_policy values across all clouddeploy_automations, keyed the same as var.clouddeploy_automations except keys with no deletion_policy are omitted"
  value       = { for k, v in google_clouddeploy_automation.clouddeploy_automations : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "clouddeploy_automations_delivery_pipeline" {
  description = "Map of delivery_pipeline values across all clouddeploy_automations, keyed the same as var.clouddeploy_automations except keys with no delivery_pipeline are omitted"
  value       = { for k, v in google_clouddeploy_automation.clouddeploy_automations : k => v.delivery_pipeline if v.delivery_pipeline != null && length(v.delivery_pipeline) > 0 }
}
output "clouddeploy_automations_description" {
  description = "Map of description values across all clouddeploy_automations, keyed the same as var.clouddeploy_automations except keys with no description are omitted"
  value       = { for k, v in google_clouddeploy_automation.clouddeploy_automations : k => v.description if v.description != null && length(v.description) > 0 }
}
output "clouddeploy_automations_effective_annotations" {
  description = "Map of effective_annotations values across all clouddeploy_automations, keyed the same as var.clouddeploy_automations except keys with no effective_annotations are omitted"
  value       = { for k, v in google_clouddeploy_automation.clouddeploy_automations : k => v.effective_annotations if v.effective_annotations != null && length(v.effective_annotations) > 0 }
}
output "clouddeploy_automations_effective_labels" {
  description = "Map of effective_labels values across all clouddeploy_automations, keyed the same as var.clouddeploy_automations except keys with no effective_labels are omitted"
  value       = { for k, v in google_clouddeploy_automation.clouddeploy_automations : k => v.effective_labels if v.effective_labels != null && length(v.effective_labels) > 0 }
}
output "clouddeploy_automations_etag" {
  description = "Map of etag values across all clouddeploy_automations, keyed the same as var.clouddeploy_automations except keys with no etag are omitted"
  value       = { for k, v in google_clouddeploy_automation.clouddeploy_automations : k => v.etag if v.etag != null && length(v.etag) > 0 }
}
output "clouddeploy_automations_labels" {
  description = "Map of labels values across all clouddeploy_automations, keyed the same as var.clouddeploy_automations except keys with no labels are omitted"
  value       = { for k, v in google_clouddeploy_automation.clouddeploy_automations : k => v.labels if v.labels != null && length(v.labels) > 0 }
}
output "clouddeploy_automations_location" {
  description = "Map of location values across all clouddeploy_automations, keyed the same as var.clouddeploy_automations except keys with no location are omitted"
  value       = { for k, v in google_clouddeploy_automation.clouddeploy_automations : k => v.location if v.location != null && length(v.location) > 0 }
}
output "clouddeploy_automations_name" {
  description = "Map of name values across all clouddeploy_automations, keyed the same as var.clouddeploy_automations except keys with no name are omitted"
  value       = { for k, v in google_clouddeploy_automation.clouddeploy_automations : k => v.name if v.name != null && length(v.name) > 0 }
}
output "clouddeploy_automations_project" {
  description = "Map of project values across all clouddeploy_automations, keyed the same as var.clouddeploy_automations except keys with no project are omitted"
  value       = { for k, v in google_clouddeploy_automation.clouddeploy_automations : k => v.project if v.project != null && length(v.project) > 0 }
}
output "clouddeploy_automations_rules" {
  description = "Map of rules values across all clouddeploy_automations, keyed the same as var.clouddeploy_automations except keys with no rules are omitted"
  value       = { for k, v in google_clouddeploy_automation.clouddeploy_automations : k => v.rules if v.rules != null && length(v.rules) > 0 }
}
output "clouddeploy_automations_selector" {
  description = "Map of selector values across all clouddeploy_automations, keyed the same as var.clouddeploy_automations except keys with no selector are omitted"
  value       = { for k, v in google_clouddeploy_automation.clouddeploy_automations : k => one(v.selector) if v.selector != null && length(v.selector) > 0 }
}
output "clouddeploy_automations_service_account" {
  description = "Map of service_account values across all clouddeploy_automations, keyed the same as var.clouddeploy_automations except keys with no service_account are omitted"
  value       = { for k, v in google_clouddeploy_automation.clouddeploy_automations : k => v.service_account if v.service_account != null && length(v.service_account) > 0 }
}
output "clouddeploy_automations_suspended" {
  description = "Map of suspended values across all clouddeploy_automations, keyed the same as var.clouddeploy_automations except keys with no suspended are omitted"
  value       = { for k, v in google_clouddeploy_automation.clouddeploy_automations : k => v.suspended if v.suspended != null }
}
output "clouddeploy_automations_terraform_labels" {
  description = "Map of terraform_labels values across all clouddeploy_automations, keyed the same as var.clouddeploy_automations except keys with no terraform_labels are omitted"
  value       = { for k, v in google_clouddeploy_automation.clouddeploy_automations : k => v.terraform_labels if v.terraform_labels != null && length(v.terraform_labels) > 0 }
}
output "clouddeploy_automations_uid" {
  description = "Map of uid values across all clouddeploy_automations, keyed the same as var.clouddeploy_automations except keys with no uid are omitted"
  value       = { for k, v in google_clouddeploy_automation.clouddeploy_automations : k => v.uid if v.uid != null && length(v.uid) > 0 }
}
output "clouddeploy_automations_update_time" {
  description = "Map of update_time values across all clouddeploy_automations, keyed the same as var.clouddeploy_automations except keys with no update_time are omitted"
  value       = { for k, v in google_clouddeploy_automation.clouddeploy_automations : k => v.update_time if v.update_time != null && length(v.update_time) > 0 }
}

