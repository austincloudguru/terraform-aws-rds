variable "name" {
  description = "Application Name"
  type        = string
  default     = "nessus"
}

variable "vpc_id" {
  description = "The name of the VPC that EFS will be deployed to"
  type        = string
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

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
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
