# Configure the Spotinst provider
provider "spotinst" {
  token = "${var.spotinst_token}"
  account = "${var.spotinst_account}"
}
# Create an Elastigroup
resource "spotinst_aws_group" "k8s-node" {
  name        = "spotinst-auto-scaling"
  description = "created by Terraform"
  product     = "Linux/UNIX"
  target_capacity = 2
  capacity {
    minimum = 2
    maximum = 5
  }
  strategy {
    risk                 = 100
    fallback_to_ondemand = true
  }

  instance_types {
    ondemand = "t2.medium"
    spot = ["m4.large", "m3.medium", "t2.medium"]
  }

  availability_zones = [
    "us-east-1a:<SUBNET_ID>",
    "us-east-1b:<SUBNET_ID>"
  ]
  launch_specification {
    monitoring = false
    image_id   = "AMI_ID"
    key_pair   = "key-pair"
    security_group_ids = ["SECURITY_GROUP_ID"]
    iam_instance_profile = "INSTANCE_ROLE"
    user_data = "${file("compute-userdata.tpl")}"
  }
  scaling_up_policy {
    policy_name = "Spotinst Scaling Policy 1"
    metric_name = "CPUUtilization"
    statistic = "average"
    unit = "percent"
    threshold = 80
    adjustment = 1
    namespace = "AWS/EC2"
    period = 300
    evaluation_periods = 2
    cooldown = 300
  }

  scaling_down_policy {
    policy_name = "Spotinst Scaling Policy 2"
    metric_name = "CPUUtilization"
    statistic = "average"
    unit = "percent"
    threshold = 40
    adjustment = 1
    namespace = "AWS/EC2"
    period = 300
    evaluation_periods = 2
    cooldown = 300
  }

  ebs_block_device {
    device_name           = "/dev/sda1"
    volume_size           = 20
    delete_on_termination = true
  }
  tags {
    "Env"     = "Test"
    "Name"    = "Spotinst kubernetes worker"
  }
  
  lifecycle {
    ignore_changes = [
      "capacity"
    ]
  }

  rancher_integration {
        master_host = "${var.rancher_endpoint}/v1"
        access_key = "RANCHER_API_ACCESS_KEY"
        secret_key = "RANCHER_API_SECRET_KEY"
  }
}
