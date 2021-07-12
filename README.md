# AWS RDS Module
[![Terratest](https://github.com/austincloudguru/terraform-aws-rds/workflows/Terratest/badge.svg?event=push)](https://github.com/austincloudguru/terraform-aws-rds/actions?query=workflow%3ATerratest) 
![Latest Version](https://img.shields.io/github/v/tag/austincloudguru/terraform-aws-rds?sort=semver&label=Latest%20Version)
[![License](https://img.shields.io/github/license/austincloudguru/terraform-aws-rds)](https://github.com/austincloudguru/terraform-aws-rds/blob/master/LICENSE)

Terraform module which creates an RDS Instance 

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
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.this_egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.this_ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_engine"></a> [engine](#input\_engine) | The database engine to use | `string` | `"postgres"` | no |
| <a name="input_name"></a> [name](#input\_name) | Application Name | `string` | `"nessus"` | no |
| <a name="input_security_group_egress"></a> [security\_group\_egress](#input\_security\_group\_egress) | Can be specified multiple times for each egress rule. | <pre>map(object({<br>    description = string<br>    from_port   = number<br>    protocol    = string<br>    to_port     = number<br>    self        = bool<br>    cidr_blocks = list(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "cidr_blocks": [<br>      "0.0.0.0/0"<br>    ],<br>    "description": "Allow All Outbound",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "self": false,<br>    "to_port": 0<br>  }<br>}</pre> | no |
| <a name="input_security_group_ingress"></a> [security\_group\_ingress](#input\_security\_group\_ingress) | Can be specified multiple times for each ingress rule. | `map(any)` | <pre>{<br>  "aurora-mysql": {<br>    "port_1": {<br>      "cidr_blocks": null,<br>      "description": "aurora-mysql",<br>      "from_port": 3306,<br>      "protocol": "tcp",<br>      "self": true,<br>      "to_port": 3306<br>    }<br>  },<br>  "aurora-postgres": {<br>    "port_1": {<br>      "cidr_blocks": null,<br>      "description": "aurora-postgres",<br>      "from_port": 5432,<br>      "protocol": "tcp",<br>      "self": true,<br>      "to_port": 5432<br>    }<br>  },<br>  "mariadb": {<br>    "port_1": {<br>      "cidr_blocks": null,<br>      "description": "mariadb",<br>      "from_port": 3306,<br>      "protocol": "tcp",<br>      "self": true,<br>      "to_port": 3306<br>    }<br>  },<br>  "mysql": {<br>    "port_1": {<br>      "cidr_blocks": null,<br>      "description": "mysql",<br>      "from_port": 3306,<br>      "protocol": "tcp",<br>      "self": true,<br>      "to_port": 3306<br>    }<br>  },<br>  "oracle-ee": {<br>    "port_1": {<br>      "cidr_blocks": null,<br>      "description": "oracle-ee",<br>      "from_port": 1521,<br>      "protocol": "tcp",<br>      "self": true,<br>      "to_port": 1521<br>    }<br>  },<br>  "oracle-se": {<br>    "port_1": {<br>      "cidr_blocks": null,<br>      "description": "oracle-se",<br>      "from_port": 1521,<br>      "protocol": "tcp",<br>      "self": true,<br>      "to_port": 1521<br>    }<br>  },<br>  "oracle-se1": {<br>    "port_1": {<br>      "cidr_blocks": null,<br>      "description": "oracle-se",<br>      "from_port": 1521,<br>      "protocol": "tcp",<br>      "self": true,<br>      "to_port": 1521<br>    }<br>  },<br>  "oracle-se2": {<br>    "port_1": {<br>      "cidr_blocks": null,<br>      "description": "oracle-se",<br>      "from_port": 1521,<br>      "protocol": "tcp",<br>      "self": true,<br>      "to_port": 1521<br>    }<br>  },<br>  "postgres": {<br>    "port_1": {<br>      "cidr_blocks": null,<br>      "description": "postgres",<br>      "from_port": 5432,<br>      "protocol": "tcp",<br>      "self": true,<br>      "to_port": 5432<br>    }<br>  },<br>  "sqlserver-ee": {<br>    "port_1": {<br>      "cidr_blocks": null,<br>      "description": "sqlserver-ee",<br>      "from_port": 1433,<br>      "protocol": "tcp",<br>      "self": true,<br>      "to_port": 1433<br>    }<br>  },<br>  "sqlserver-ex": {<br>    "port_1": {<br>      "cidr_blocks": null,<br>      "description": "sqlserver-ex",<br>      "from_port": 1433,<br>      "protocol": "tcp",<br>      "self": true,<br>      "to_port": 1433<br>    }<br>  },<br>  "sqlserver-se": {<br>    "port_1": {<br>      "cidr_blocks": null,<br>      "description": "sqlserver-se",<br>      "from_port": 1433,<br>      "protocol": "tcp",<br>      "self": true,<br>      "to_port": 1433<br>    }<br>  },<br>  "sqlserver-web": {<br>    "port_1": {<br>      "cidr_blocks": null,<br>      "description": "sqlserver-web",<br>      "from_port": 1433,<br>      "protocol": "tcp",<br>      "self": true,<br>      "to_port": 1433<br>    }<br>  }<br>}</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The name of the VPC that EFS will be deployed to | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_security_group_arn"></a> [security\_group\_arn](#output\_security\_group\_arn) | Security Group ARN |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | Security Group ID |
| <a name="output_security_group_name"></a> [security\_group\_name](#output\_security\_group\_name) | Security Group name |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
