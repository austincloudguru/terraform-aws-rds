# AWS RDS Module
[![Terratest](https://github.com/austincloudguru/terraform-aws-rds/workflows/Terratest/badge.svg?event=push)](https://github.com/austincloudguru/terraform-aws-rds/actions?query=workflow%3ATerratest) 
![Latest Version](https://img.shields.io/github/v/tag/austincloudguru/terraform-aws-rds?sort=semver&label=Latest%20Version)
[![License](https://img.shields.io/github/license/austincloudguru/terraform-aws-rds)](https://github.com/austincloudguru/terraform-aws-rds/blob/master/LICENSE)

Terraform module which creates an RDS Instance 

## Usage

```hcl
module "rds_instance {
  source = austincloudguru/rds/aws
  # You should pin the module to a specific version
  # version              = "x.x.x"
  name                 = "app_name"
  engine               = "mysql"
  engin_version        = "5.7.17"
  db_subnet_group_name = "database"
  deletion_protection  = false
  multi_az             = false
  skip_final_snapshot  = true
  vpc_id               = "vpc-xxxxxxxx"
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.6, < 1.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~>3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~>3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_kms_alias.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.this_egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.this_ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocated_storage"></a> [allocated\_storage](#input\_allocated\_storage) | The allocated storage in gibibytes | `number` | `20` | no |
| <a name="input_allow_major_version_upgrade"></a> [allow\_major\_version\_upgrade](#input\_allow\_major\_version\_upgrade) | Indicates that major version upgrades are allowed. | `bool` | `false` | no |
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Specifies whether any database modifications are applied immediately, or during the next maintenance window | `bool` | `false` | no |
| <a name="input_auto_minor_version_upgrade"></a> [auto\_minor\_version\_upgrade](#input\_auto\_minor\_version\_upgrade) | Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window | `bool` | `true` | no |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | The AZ for the RDS instance. | `string` | `null` | no |
| <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period) | The days to retain backups for. Must be between 0 and 35 | `number` | `15` | no |
| <a name="input_backup_window"></a> [backup\_window](#input\_backup\_window) | The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. | `string` | `null` | no |
| <a name="input_ca_cert_identifier"></a> [ca\_cert\_identifier](#input\_ca\_cert\_identifier) | The identifier of the CA certificate for the DB instance | `string` | `null` | no |
| <a name="input_character_set_name"></a> [character\_set\_name](#input\_character\_set\_name) | The character set name to use for DB encoding in Oracle and Microsoft SQL instances (collation). | `string` | `null` | no |
| <a name="input_copy_tags_to_snapshot"></a> [copy\_tags\_to\_snapshot](#input\_copy\_tags\_to\_snapshot) | Copy all Instance tags to snapshots. | `bool` | `false` | no |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | Optional Database Name | `string` | `null` | no |
| <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name) | Name of DB subnet group. | `string` | n/a | yes |
| <a name="input_delete_automated_backups"></a> [delete\_automated\_backups](#input\_delete\_automated\_backups) | Specifies whether to remove automated backups immediately after the DB instance is deleted. | `bool` | `true` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | If the DB instance should have deletion protection enabled. | `bool` | `true` | no |
| <a name="input_deletion_window_in_days"></a> [deletion\_window\_in\_days](#input\_deletion\_window\_in\_days) | Duration in days after which the key is deleted after destruction of the resource, must be between 7 and 30 days. | `number` | `30` | no |
| <a name="input_enable_key_rotation"></a> [enable\_key\_rotation](#input\_enable\_key\_rotation) | Specifies whether key rotation is enabled. | `bool` | `false` | no |
| <a name="input_enabled_cloudwatch_logs_exports"></a> [enabled\_cloudwatch\_logs\_exports](#input\_enabled\_cloudwatch\_logs\_exports) | List of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine): alert, audit, error, general, listener, slowquery, trace, postgresql (PostgreSQL), upgrade (PostgreSQL). | `list(string)` | `[]` | no |
| <a name="input_encrypt_db"></a> [encrypt\_db](#input\_encrypt\_db) | Set whether RDS should be encrypted | `bool` | `true` | no |
| <a name="input_engine"></a> [engine](#input\_engine) | The database engine to use | `string` | `"postgres"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | The engine version to use | `string` | `"12.7"` | no |
| <a name="input_final_snapshot_identifier"></a> [final\_snapshot\_identifier](#input\_final\_snapshot\_identifier) | The name of your final DB snapshot when this DB instance is deleted. | `string` | `""` | no |
| <a name="input_iam_database_authentication_enabled"></a> [iam\_database\_authentication\_enabled](#input\_iam\_database\_authentication\_enabled) | Specifies whether or mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled | `bool` | `false` | no |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | The instance type of the RDS instance | `string` | `"db.t2.medium"` | no |
| <a name="input_iops"></a> [iops](#input\_iops) | The amount of provisioned IOPS. Setting this implies a storage\_type of 'io1' | `number` | `null` | no |
| <a name="input_license_model"></a> [license\_model](#input\_license\_model) | License model information for this DB instance. (Required for some engines) | `string` | `null` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi' UTC | `string` | `null` | no |
| <a name="input_max_allocated_storage"></a> [max\_allocated\_storage](#input\_max\_allocated\_storage) | When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance. | `number` | `null` | no |
| <a name="input_monitoring_interval"></a> [monitoring\_interval](#input\_monitoring\_interval) | The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. | `number` | `0` | no |
| <a name="input_monitoring_role_arn"></a> [monitoring\_role\_arn](#input\_monitoring\_role\_arn) | The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs | `string` | `null` | no |
| <a name="input_multi_az"></a> [multi\_az](#input\_multi\_az) | Specifies if the RDS instance is multi-AZ | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | Application Name | `string` | `"nessus"` | no |
| <a name="input_option_group_name"></a> [option\_group\_name](#input\_option\_group\_name) | Name of the DB option group to associate | `string` | `null` | no |
| <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name) | Name of the DB parameter group to associate | `string` | `null` | no |
| <a name="input_password"></a> [password](#input\_password) | Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file | `string` | `"myMasterPassword1!"` | no |
| <a name="input_performance_insights_enabled"></a> [performance\_insights\_enabled](#input\_performance\_insights\_enabled) | Specifies whether Performance Insights are enabled. | `bool` | `false` | no |
| <a name="input_performance_insights_kms_key_id"></a> [performance\_insights\_kms\_key\_id](#input\_performance\_insights\_kms\_key\_id) | The ARN for the KMS key to encrypt Performance Insights data. Once KMS key is set, it can never be changed. | `string` | `null` | no |
| <a name="input_performance_insights_retention_period"></a> [performance\_insights\_retention\_period](#input\_performance\_insights\_retention\_period) | The amount of time in days to retain Performance Insights data. Either 7 (7 days) or 731 (2 years). | `number` | `null` | no |
| <a name="input_port"></a> [port](#input\_port) | The port on which the DB accepts connections. | `number` | `null` | no |
| <a name="input_publicly_accessible"></a> [publicly\_accessible](#input\_publicly\_accessible) | Bool to control if instance is publicly accessible. | `bool` | `false` | no |
| <a name="input_security_group_egress"></a> [security\_group\_egress](#input\_security\_group\_egress) | Can be specified multiple times for each egress rule. | <pre>map(object({<br>    description = string<br>    from_port   = number<br>    protocol    = string<br>    to_port     = number<br>    self        = bool<br>    cidr_blocks = list(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "cidr_blocks": [<br>      "0.0.0.0/0"<br>    ],<br>    "description": "Allow All Outbound",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "self": false,<br>    "to_port": 0<br>  }<br>}</pre> | no |
| <a name="input_security_group_ingress"></a> [security\_group\_ingress](#input\_security\_group\_ingress) | Can be specified multiple times for each ingress rule. | `map(any)` | <pre>{<br>  "aurora-mysql": {<br>    "port_1": {<br>      "cidr_blocks": null,<br>      "description": "aurora-mysql",<br>      "from_port": 3306,<br>      "protocol": "tcp",<br>      "self": true,<br>      "to_port": 3306<br>    }<br>  },<br>  "aurora-postgres": {<br>    "port_1": {<br>      "cidr_blocks": null,<br>      "description": "aurora-postgres",<br>      "from_port": 5432,<br>      "protocol": "tcp",<br>      "self": true,<br>      "to_port": 5432<br>    }<br>  },<br>  "mariadb": {<br>    "port_1": {<br>      "cidr_blocks": null,<br>      "description": "mariadb",<br>      "from_port": 3306,<br>      "protocol": "tcp",<br>      "self": true,<br>      "to_port": 3306<br>    }<br>  },<br>  "mysql": {<br>    "port_1": {<br>      "cidr_blocks": null,<br>      "description": "mysql",<br>      "from_port": 3306,<br>      "protocol": "tcp",<br>      "self": true,<br>      "to_port": 3306<br>    }<br>  },<br>  "oracle-ee": {<br>    "port_1": {<br>      "cidr_blocks": null,<br>      "description": "oracle-ee",<br>      "from_port": 1521,<br>      "protocol": "tcp",<br>      "self": true,<br>      "to_port": 1521<br>    }<br>  },<br>  "oracle-se": {<br>    "port_1": {<br>      "cidr_blocks": null,<br>      "description": "oracle-se",<br>      "from_port": 1521,<br>      "protocol": "tcp",<br>      "self": true,<br>      "to_port": 1521<br>    }<br>  },<br>  "oracle-se1": {<br>    "port_1": {<br>      "cidr_blocks": null,<br>      "description": "oracle-se",<br>      "from_port": 1521,<br>      "protocol": "tcp",<br>      "self": true,<br>      "to_port": 1521<br>    }<br>  },<br>  "oracle-se2": {<br>    "port_1": {<br>      "cidr_blocks": null,<br>      "description": "oracle-se",<br>      "from_port": 1521,<br>      "protocol": "tcp",<br>      "self": true,<br>      "to_port": 1521<br>    }<br>  },<br>  "postgres": {<br>    "port_1": {<br>      "cidr_blocks": null,<br>      "description": "postgres",<br>      "from_port": 5432,<br>      "protocol": "tcp",<br>      "self": true,<br>      "to_port": 5432<br>    }<br>  },<br>  "sqlserver-ee": {<br>    "port_1": {<br>      "cidr_blocks": null,<br>      "description": "sqlserver-ee",<br>      "from_port": 1433,<br>      "protocol": "tcp",<br>      "self": true,<br>      "to_port": 1433<br>    }<br>  },<br>  "sqlserver-ex": {<br>    "port_1": {<br>      "cidr_blocks": null,<br>      "description": "sqlserver-ex",<br>      "from_port": 1433,<br>      "protocol": "tcp",<br>      "self": true,<br>      "to_port": 1433<br>    }<br>  },<br>  "sqlserver-se": {<br>    "port_1": {<br>      "cidr_blocks": null,<br>      "description": "sqlserver-se",<br>      "from_port": 1433,<br>      "protocol": "tcp",<br>      "self": true,<br>      "to_port": 1433<br>    }<br>  },<br>  "sqlserver-web": {<br>    "port_1": {<br>      "cidr_blocks": null,<br>      "description": "sqlserver-web",<br>      "from_port": 1433,<br>      "protocol": "tcp",<br>      "self": true,<br>      "to_port": 1433<br>    }<br>  }<br>}</pre> | no |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | Determines whether a final DB snapshot is created before the DB instance is deleted | `bool` | `true` | no |
| <a name="input_snapshot_identifier"></a> [snapshot\_identifier](#input\_snapshot\_identifier) | Specifies whether or not to create this database from a snapshot. This correlates to the snapshot ID you'd find in the RDS console | `string` | `null` | no |
| <a name="input_storage_type"></a> [storage\_type](#input\_storage\_type) | One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD) | `string` | `"gp2"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_username"></a> [username](#input\_username) | Username for the master DB user. | `string` | `"postgres"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The name of the VPC that EFS will be deployed to | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kms_alias_arn"></a> [kms\_alias\_arn](#output\_kms\_alias\_arn) | The Amazon Resource Name (ARN) of the key alias |
| <a name="output_kms_arn"></a> [kms\_arn](#output\_kms\_arn) | The Amazon Resource Name (ARN) of the key |
| <a name="output_kms_id"></a> [kms\_id](#output\_kms\_id) | The globally unique identifier for the key. |
| <a name="output_rds_address"></a> [rds\_address](#output\_rds\_address) | The hostname of the RDS instance. |
| <a name="output_rds_arn"></a> [rds\_arn](#output\_rds\_arn) | The ARN of the RDS instance. |
| <a name="output_rds_endpoint"></a> [rds\_endpoint](#output\_rds\_endpoint) | The connection endpoint in address:port format. |
| <a name="output_rds_hosted_zone_id"></a> [rds\_hosted\_zone\_id](#output\_rds\_hosted\_zone\_id) | The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record). |
| <a name="output_rds_id"></a> [rds\_id](#output\_rds\_id) | The RDS instance ID. |
| <a name="output_rds_resource_id"></a> [rds\_resource\_id](#output\_rds\_resource\_id) | The RDS Resource ID of this instance. |
| <a name="output_security_group_arn"></a> [security\_group\_arn](#output\_security\_group\_arn) | Security Group ARN |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | Security Group ID |
| <a name="output_security_group_name"></a> [security\_group\_name](#output\_security\_group\_name) | Security Group name |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
