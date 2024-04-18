#-----------------------------------
# Create the Security Group
#-----------------------------------
resource "aws_security_group" "this" {
  name        = var.name
  description = join(" ", ["Security Group for", var.name])
  vpc_id      = var.vpc_id
  tags = merge(
    {
      "Name" = var.name
    },
    var.tags
  )
  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}

resource "aws_security_group_rule" "this_ingress" {
  for_each          = var.security_group_ingress[var.engine]
  security_group_id = aws_security_group.this.id
  type              = "ingress"
  description       = lookup(each.value, "description", null)
  from_port         = lookup(each.value, "from_port", null)
  protocol          = lookup(each.value, "protocol", null)
  to_port           = lookup(each.value, "to_port", null)
  self              = lookup(each.value, "self", null) == false ? null : each.value.self
  cidr_blocks       = lookup(each.value, "cidr_blocks", null)
}

resource "aws_security_group_rule" "this_egress" {
  for_each          = var.security_group_egress
  security_group_id = aws_security_group.this.id
  type              = "egress"
  description       = lookup(each.value, "description", null)
  from_port         = lookup(each.value, "from_port", null)
  protocol          = lookup(each.value, "protocol", null)
  to_port           = lookup(each.value, "to_port", null)
  self              = lookup(each.value, "self", null) == false ? null : each.value.self
  cidr_blocks       = lookup(each.value, "cidr_blocks", null)
}

#-----------------------------------
# Create the KMS Keys
#-----------------------------------
resource "aws_kms_key" "this" {
  #checkov:skip=CKV_AWS_7: "Ensure rotation for customer created CMKs is enabled"
  count                   = var.encrypt_db ? 1 : 0
  description             = join(" ", ["Encryption Key for", var.name, "RDS"])
  deletion_window_in_days = var.deletion_window_in_days
  enable_key_rotation     = var.enable_key_rotation
  policy                  = var.policy
  tags = merge(
    {
      "Name" = var.name
    },
    var.tags
  )
}

resource "aws_kms_alias" "this" {
  count         = var.encrypt_db ? 1 : 0
  name          = join("", ["alias/", var.name, "-rds"])
  target_key_id = aws_kms_key.this[0].key_id
}

#-----------------------------------
# Create the RDS Instance
#-----------------------------------
resource "aws_db_instance" "this" {
  # Set by Variables
  #checkov:skip=CKV_AWS_293: "Ensure that AWS database instances have deletion protection enabled"
  #checkov:skip=CKV_AWS_353: "Ensure that RDS instances have performance insights enabled"
  #checkov:skip=CKV_AWS_157: "Ensure that RDS instances have Multi-AZ enabled"
  #checkov:skip=CKV_AWS_129: "Ensure that respective logs of Amazon Relational Database Service (Amazon RDS) are enabled"
  #checkov:skip=CKV_AWS_118: "Ensure that enhanced monitoring is enabled for Amazon RDS instances"
  #checkov:skip=CKV2_AWS_60: "Ensure RDS instance with copy tags to snapshots is enabled"
  # Disables 
  #checkov:skip=CKV2_AWS_30: "Ensure Postgres RDS as aws_db_instance has Query Logging enabled"
  identifier                            = var.name
  multi_az                              = var.multi_az
  instance_class                        = var.instance_class
  deletion_protection                   = var.deletion_protection
  db_subnet_group_name                  = var.db_subnet_group_name
  port                                  = var.port
  publicly_accessible                   = var.publicly_accessible
  engine                                = var.engine
  engine_version                        = var.engine_version
  auto_minor_version_upgrade            = var.auto_minor_version_upgrade
  allow_major_version_upgrade           = var.allow_major_version_upgrade
  allocated_storage                     = var.allocated_storage
  max_allocated_storage                 = var.max_allocated_storage
  storage_type                          = var.storage_type
  iops                                  = var.storage_type == "io1" ? var.iops : 0
  storage_encrypted                     = var.encrypt_db
  kms_key_id                            = var.encrypt_db ? aws_kms_key.this[0].arn : null
  backup_retention_period               = var.backup_retention_period
  db_name                               = var.database_name
  username                              = var.username
  password                              = var.password
  skip_final_snapshot                   = var.skip_final_snapshot
  final_snapshot_identifier             = var.skip_final_snapshot ? null : var.final_snapshot_identifier
  vpc_security_group_ids                = [aws_security_group.this.id]
  apply_immediately                     = var.apply_immediately
  availability_zone                     = var.availability_zone
  ca_cert_identifier                    = var.ca_cert_identifier
  character_set_name                    = var.character_set_name
  enabled_cloudwatch_logs_exports       = var.enabled_cloudwatch_logs_exports
  maintenance_window                    = var.maintenance_window
  monitoring_interval                   = var.monitoring_interval
  monitoring_role_arn                   = var.monitoring_role_arn
  iam_database_authentication_enabled   = var.iam_database_authentication_enabled
  performance_insights_enabled          = var.performance_insights_enabled
  performance_insights_kms_key_id       = var.performance_insights_kms_key_id
  performance_insights_retention_period = var.performance_insights_retention_period
  snapshot_identifier                   = var.snapshot_identifier
  option_group_name                     = var.option_group_name
  parameter_group_name                  = var.parameter_group_name
  copy_tags_to_snapshot                 = var.copy_tags_to_snapshot


  tags = merge(
    {
      "Name" = var.name
    },
    var.tags
  )
}
