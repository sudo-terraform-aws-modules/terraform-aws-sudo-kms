
output "basic_key_arn" {
  description = "The Amazon Resource Name (ARN) of the key"
  value       = module.kms_key_basic.key_arn
}

output "basic_key_id" {
  description = "The globally unique identifier for the key"
  value       = module.kms_key_basic.key_id
}


output "complete_key_arn" {
  description = "The Amazon Resource Name (ARN) of the key"
  value       = module.kms_key_complete.key_arn
}

output "complete_key_id" {
  description = "The globally unique identifier for the key"
  value       = module.kms_key_complete.key_id
}
