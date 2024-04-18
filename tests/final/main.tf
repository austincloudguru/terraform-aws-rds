data "aws_db_instance" "this" {
  db_instance_identifier = var.db_instance_identifier
}

variable "db_instance_identifier" {
  type        = string
  description = "Name of the RDS instance"
}
