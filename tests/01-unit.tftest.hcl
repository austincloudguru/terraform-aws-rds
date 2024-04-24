provider "aws" {
  region = "us-west-2"
  default_tags {
    tags = {
      Environment = "Test"
    }
  }
}

variables {
  name = "rds-module-test"
}

run "validate_variables" {
  command = plan

  variables {
    db_subnet_group_name = "mygroup"
    vpc_id               = "my-vpc"
    engine               = "nosql"
    license_model        = "license-not-included"
    monitoring_interval  = 18
    storage_type         = "fast"
  }

  expect_failures = [
    var.engine,
    var.license_model,
    var.monitoring_interval,
    var.storage_type
  ]

}

run "validate_terraform" {
  command = plan
  
  variables {
    vpc_id               = "vpc_id"
    db_subnet_group_name = "my-subnet-group"
    deletion_protection  = false
    multi_az             = false
    skip_final_snapshot  = true
  }
}
