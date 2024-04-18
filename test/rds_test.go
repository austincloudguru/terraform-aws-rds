package test

import (
	"testing"
	//"fmt"
	"time"
  // http_helper "github.com/gruntwork-io/terratest/modules/http-helper"
	"github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestExamplesTerraform(t *testing.T) {
  t.Parallel()
  terraformOpts := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
    TerraformDir: "../examples/terratest/",
  })

  defer terraform.Destroy(t, terraformOpts)
  terraform.InitAndApply(t, terraformOpts)

  // Verify that the RDS Security Group 
  sgName := terraform.Output(t, terraformOpts, "security_group_name")
  assert.Equal(t, sgName, "terratest")

  tfRdsInstanceId := terraform.Output(t, terraformOpts, "rds_id")
  tfRdsAddress := terraform.Output(t, terraformOpts, "rds_address")

  time.Sleep(30 * time.Second)
  awsRdsAddress := aws.GetAddressOfRdsInstance(t, tfRdsInstanceId, "us-west-2")

  assert.Equal(t, awsRdsAddress, tfRdsAddress)
}
