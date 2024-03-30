output "key_arn" {
  description = "The Amazon Resource Name (ARN) of the key"
  value       = aws_kms_key.key[0].arn
}

output "key_id" {
  description = "The globally unique identifier for the key"
  value       = aws_kms_key.key[0].key_id
}
