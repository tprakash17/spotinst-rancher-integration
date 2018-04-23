variable "spotinst_token" {
  description = "Enter spotinst token"
}
variable "spotinst_account" {
  description = "Enter spotinst account ID"
}
variable "ami"{
        default = "AMI-ID" #we chose ami-88d136f5 ubuntu 16.04
} 
variable "rancher_instance_type"{
        default = "t2.medium"
}
variable "security_group"{
        default = "SECURTIY_GROUP_ID"
}
variable "key_name"{
        default = "KEYPAIR_NAME"
}
variable "iam_instance_profile"{
        default = "IAM-INSTANCE-ROLE"
}
variable "vpc_id"{
        default = "VPC-ID"
}
variable "rancher_endpoint"{
        default = "RANCHER-URL"
}
variable "rancher_env"{
        description = "Enter rancher ENV name"
}
variable "rancher_compute"{
        default = "Rancher-compute"
}
variable "compute_instance_type"{
        default = "t2.medium"
}
