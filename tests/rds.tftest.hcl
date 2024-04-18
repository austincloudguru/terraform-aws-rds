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

run "setup_vpc" {
  command = apply
  module {
    source = "terraform-aws-modules/vpc/aws"
  }

  variables {
    cidr                         = "10.0.0.0/16"
    azs                          = ["us-west-2a", "us-west-2b"]
    private_subnets              = ["10.0.1.0/24", "10.0.2.0/24"]
    public_subnets               = ["10.0.101.0/24", "10.0.102.0/24"]
    database_subnets             = ["10.0.201.0/24", "10.0.202.0/24"]
    create_database_subnet_group = true
    enable_nat_gateway           = true
    single_nat_gateway           = true
  }
}

run "setup_database" {
  command = apply
  
  variables {
    vpc_id               = run.setup_vpc.vpc_id
    db_subnet_group_name = run.setup_vpc.database_subnet_group
    deletion_protection  = false
    multi_az             = false
    skip_final_snapshot  = true
  }
}

run "database_tests" {
  command = apply

  module {
    source = "./tests/final"
  }

  variables {
    db_instance_identifier = var.name
  }

  assert {
    condition     = data.aws_db_instance.this.endpoint == run.setup_database.endpoint 
    error_message = "Something is not quite right with the database"
  }

}
