output "security_group_id" {
  value       = aws_security_group.this.id
  description = "Security Group ID"
}

output "security_group_arn" {
  value       = aws_security_group.this.arn
  description = "Security Group ARN"
}

output "security_group_name" {
  value       = aws_security_group.this.name
  description = "Security Group name"
}

output "kms_arn" {
  description = "The Amazon Resource Name (ARN) of the key"
  value       = aws_kms_key.this[0].arn
}

output "kms_id" {
  description = "The globally unique identifier for the key."
  value       = aws_kms_key.this[0].key_id
}

output "kms_alias_arn" {
  description = "The Amazon Resource Name (ARN) of the key alias"
  value       = aws_kms_alias.this[0].arn
}

output "rds_address" {
  description = "The hostname of the RDS instance. "
  value       = aws_db_instance.this.address
}

output "rds_arn" {
  description = "The ARN of the RDS instance."
  value       = aws_db_instance.this.arn
}

output "rds_endpoint" {
  description = "The connection endpoint in address:port format."
  value       = aws_db_instance.this.endpoint
}

output "rds_hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)."
  value       = aws_db_instance.this.hosted_zone_id
}

output "rds_id" {
  description = "The RDS instance ID."
  value       = aws_db_instance.this.id
}

output "rds_resource_id" {
  description = "The RDS Resource ID of this instance."
  value       = aws_db_instance.this.resource_id
}
