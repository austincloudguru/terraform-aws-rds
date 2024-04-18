variable "allocated_storage" {
  description = "The allocated storage in gibibytes"
  type        = number
  default     = 20
}

variable "apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window"
  type        = bool
  default     = false
}

variable "allow_major_version_upgrade" {
  description = "Indicates that major version upgrades are allowed."
  type        = bool
  default     = false
}

variable "auto_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window"
  type        = bool
  default     = true
}

variable "availability_zone" {
  description = "The AZ for the RDS instance."
  type        = string
  default     = null
}

variable "backup_retention_period" {
  description = "The days to retain backups for. Must be between 0 and 35"
  type        = number
  default     = 15
}

variable "backup_window" {
  type        = string
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'."
  default     = null
}

variable "ca_cert_identifier" {
  description = "The identifier of the CA certificate for the DB instance"
  type        = string
  default     = null
}

variable "character_set_name" {
  description = " The character set name to use for DB encoding in Oracle and Microsoft SQL instances (collation)."
  type        = string
  default     = null
}

variable "copy_tags_to_snapshot" {
  description = "Copy all Instance tags to snapshots."
  type        = bool
  default     = false
}

variable "database_name" {
  description = "Optional Database Name"
  type        = string
  default     = null
}

variable "db_subnet_group_name" {
  description = "Name of DB subnet group."
  type        = string
}

variable "delete_automated_backups" {
  description = "Specifies whether to remove automated backups immediately after the DB instance is deleted."
  type        = bool
  default     = true

}

variable "deletion_protection" {
  description = "If the DB instance should have deletion protection enabled."
  type        = bool
  default     = true
}

variable "deletion_window_in_days" {
  description = "Duration in days after which the key is deleted after destruction of the resource, must be between 7 and 30 days."
  type        = number
  default     = 30

}

variable "enable_key_rotation" {
  description = "Specifies whether key rotation is enabled."
  type        = bool
  default     = false
}

variable "enabled_cloudwatch_logs_exports" {
  description = "List of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine): alert, audit, error, general, listener, slowquery, trace, postgresql (PostgreSQL), upgrade (PostgreSQL)."
  type        = list(string)
  default     = []
}

variable "encrypt_db" {
  description = "Set whether RDS should be encrypted"
  type        = bool
  default     = true
}

variable "engine" {
  description = "The database engine to use"
  type        = string
  default     = "postgres"
  validation {
    condition = anytrue([
      var.engine == "aurora-mysql",
      var.engine == "aurora-postgres",
      var.engine == "postgres",
      var.engine == "mysql",
      var.engine == "mariadb",
      var.engine == "oracle-ee",
      var.engine == "oracle-se",
      var.engine == "oracle-se1",
      var.engine == "oracle-se2",
      var.engine == "sqlserver-se",
      var.engine == "sqlserver-ee",
      var.engine == "sqlserver-ex",
      var.engine == "sqlserver-web"
    ])
    error_message = "Sorry, type must be supported database type."
  }
}

variable "engine_version" {
  description = "The engine version to use"
  type        = string
  default     = "16.2"
}

variable "final_snapshot_identifier" {
  description = "The name of your final DB snapshot when this DB instance is deleted."
  type        = string
  default     = ""
}

variable "iam_database_authentication_enabled" {
  description = "Specifies whether or mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled"
  type        = bool
  default     = false
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
  default     = "db.t2.medium"
}

variable "iops" {
  description = "The amount of provisioned IOPS. Setting this implies a storage_type of 'io1'"
  type        = number
  default     = null
}

variable "license_model" {
  description = "License model information for this DB instance. (Required for some engines)"
  type        = string
  default     = null
  validation {
    condition = anytrue([
      var.license_model == null,
      var.license_model == "license-included",
      var.license_model == "bring-your-own-license",
      var.license_model == "general-public-license"
    ])
    error_message = "Valid values: license-included | bring-your-own-license | general-public-license."
  }
}

variable "maintenance_window" {
  description = "The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi' UTC "
  type        = string
  default     = null
}

variable "max_allocated_storage" {
  description = "When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance."
  type        = number
  default     = null
}

variable "monitoring_interval" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0."
  type        = number
  default     = 0
  validation {
    condition = anytrue([
      var.monitoring_interval == 0,
      var.monitoring_interval == 1,
      var.monitoring_interval == 5,
      var.monitoring_interval == 10,
      var.monitoring_interval == 15,
      var.monitoring_interval == 30,
      var.monitoring_interval == 60
    ])
    error_message = "Valid Values are 0, 1, 5, 10, 15, 30, 60."
  }
}

variable "monitoring_role_arn" {
  description = "The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs"
  type        = string
  default     = null
}

variable "multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  type        = bool
  default     = true
}

variable "name" {
  description = "Application Name"
  type        = string
  default     = "nessus"
}

variable "option_group_name" {
  description = "Name of the DB option group to associate"
  type        = string
  default     = null
}

variable "parameter_group_name" {
  description = "Name of the DB parameter group to associate"
  type        = string
  default     = null
}

variable "password" {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file"
  type        = string
  default     = "myMasterPassword1!"
}

variable "performance_insights_enabled" {
  description = "Specifies whether Performance Insights are enabled."
  type        = bool
  default     = false
}

variable "performance_insights_kms_key_id" {
  description = "The ARN for the KMS key to encrypt Performance Insights data. Once KMS key is set, it can never be changed."
  type        = string
  default     = null
}

variable "performance_insights_retention_period" {
  description = "The amount of time in days to retain Performance Insights data. Either 7 (7 days) or 731 (2 years)."
  type        = number
  default     = null
}

variable "port" {
  description = "The port on which the DB accepts connections."
  type        = number
  default     = null
}

variable "publicly_accessible" {
  description = "Bool to control if instance is publicly accessible."
  type        = bool
  default     = false
}

variable "security_group_egress" {
  description = "Can be specified multiple times for each egress rule. "
  type = map(object({
    description = string
    from_port   = number
    protocol    = string
    to_port     = number
    self        = bool
    cidr_blocks = list(string)
  }))
  default = {
    default = {
      description = "Allow All Outbound"
      from_port   = 0
      protocol    = "-1"
      to_port     = 0
      self        = false
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

variable "security_group_ingress" {
  description = "Can be specified multiple times for each ingress rule. "
  type        = map(any)
  default = {
    aurora-postgres = {
      port_1 = { description = "aurora-postgres", from_port = 5432, protocol = "tcp", to_port = 5432, self = true, cidr_blocks = null }
    }
    aurora-mysql = {
      port_1 = { description = "aurora-mysql", from_port = 3306, protocol = "tcp", to_port = 3306, self = true, cidr_blocks = null }
    }
    postgres = {
      port_1 = { description = "postgres", from_port = 5432, protocol = "tcp", to_port = 5432, self = true, cidr_blocks = null }
    }
    mysql = {
      port_1 = { description = "mysql", from_port = 3306, protocol = "tcp", to_port = 3306, self = true, cidr_blocks = null }
    }
    mariadb = {
      port_1 = { description = "mariadb", from_port = 3306, protocol = "tcp", to_port = 3306, self = true, cidr_blocks = null }
    }
    oracle-ee = {
      port_1 = { description = "oracle-ee", from_port = 1521, protocol = "tcp", to_port = 1521, self = true, cidr_blocks = null }
    }
    oracle-se = {
      port_1 = { description = "oracle-se", from_port = 1521, protocol = "tcp", to_port = 1521, self = true, cidr_blocks = null }
    }
    oracle-se1 = {
      port_1 = { description = "oracle-se", from_port = 1521, protocol = "tcp", to_port = 1521, self = true, cidr_blocks = null }
    }
    oracle-se2 = {
      port_1 = { description = "oracle-se", from_port = 1521, protocol = "tcp", to_port = 1521, self = true, cidr_blocks = null }
    }
    sqlserver-se = {
      port_1 = { description = "sqlserver-se", from_port = 1433, protocol = "tcp", to_port = 1433, self = true, cidr_blocks = null },
    }
    sqlserver-web = {
      port_1 = { description = "sqlserver-web", from_port = 1433, protocol = "tcp", to_port = 1433, self = true, cidr_blocks = null },
    }
    sqlserver-ex = {
      port_1 = { description = "sqlserver-ex", from_port = 1433, protocol = "tcp", to_port = 1433, self = true, cidr_blocks = null },
    }
    sqlserver-ee = {
      port_1 = { description = "sqlserver-ee", from_port = 1433, protocol = "tcp", to_port = 1433, self = true, cidr_blocks = null },
    }
  }
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted"
  type        = bool
  default     = true
}

variable "snapshot_identifier" {
  description = "Specifies whether or not to create this database from a snapshot. This correlates to the snapshot ID you'd find in the RDS console"
  type        = string
  default     = null
}

variable "storage_type" {
  description = "One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD)"
  type        = string
  default     = "gp2"
  validation {
    condition = anytrue([
      var.storage_type == "standard",
      var.storage_type == "gp2",
      var.storage_type == "io1"
    ])
    error_message = "Sorry, type must be supported storage type."
  }
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "username" {
  description = "Username for the master DB user."
  type        = string
  default     = "postgres"
}

variable "vpc_id" {
  description = "The name of the VPC that EFS will be deployed to"
  type        = string
}

variable "policy" {
  description = "A valid policy JSON document. Although this is a key policy, not an IAM policy, an aws_iam_policy_document, in the form that designates a principal, can be used."
  type        = string
  default     = null
}
