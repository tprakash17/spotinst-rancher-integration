
# spotinst-rancher-integration
Project is to help in reducing overall AWS infrastructure cost if you are running kubernetes using rancher on AWS.

# Introduction

We use rancher to setup kubernetes and till now, we were using EC2 on demand instances for kubernetes workload. We wanted to reduce the overall cost involved in running kubernetes workload on AWS. With the use of Spotinst, we can make use of EC2 spot instances as worker nodes within kubernetes to run applications which significantly reduces the cost. 

You can read more about rancher and spotinst on the provided links.

# Prerequisites & their installation

Things you need before you can start. 

Linux Machine, Existing rancher environment configured with kubernetes master components ( API, etcd and controllers ... ), AWS CLI configured with required iam permission, Terraform ( we used 0.11 version ), Terraform configured with Spotinst provider and AWS provider.

```
$ curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
$ unzip awscli-bundle.zip
$ ./awscli-bundle/install -b ~/bin/aws
$ cp -prf ~/bin/aws /usr/local/bin/aws
$ aws configure
AWS Access Key ID: [ENTER ACCESS KEY]
AWS Secret Access Key: [ENTER SECRET KEY]
Default region name [us-east-1]: 
Default output format [None]:


$ wget https://releases.hashicorp.com/terraform/0.11.5/terraform_0.11.5_linux_amd64.zip
$ unzip terraform_0.9.5_linux_amd64.zip
$ mv terraform_0.9.5_linux_amd64 terraform
$ cp -prf terraform /usr/bin/ /usr/sbin/ /usr/local/bin/terraform

$ mkdir -p /opt/spotinst
$ cd /opt/spotinst
$ wget http://spotinst-public.s3.amazonaws.com/integrations/terraform/v0.11.4/linux_amd64/terraform-provider-spotinst
$ chmod +x terraform-provider-spotinst
```
# Clone repository

# Make Necessary changes 
Before you can run terraform apply. Please make sure we update all the files with required values. 
 
