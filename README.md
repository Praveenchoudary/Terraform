# Terraform
                                                          TERRAFORM
Terraform, an open source “Infrastructure as Code” tool created by HashiCorp, allows programmers to build, change and version infrastructure safely and efficiently.
Installation of Terraform:
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform

                   

•	To communicate Terraform to Aws. We need provide access key and secret key.
•	To generate this keys go security in aws console and Generate keys
•	Now To configure that keys to terraform. We should perform the command
                     “aws configure”
•	After execution of above command we need to provide keys which are generated in aws console
To Write Terraform file the extension for file should .tf
Create a aws Ec2 instance by using Terraform 
main.tf (file name)
provider "aws" {
region="ap-south-1"           #Thsi is Provider section
}                                                 
resource "aws_instance" "flm" {
tags= {
Name="my-terraform-server"              # This is resource section
Project="Zomato"
}
ami="ami-06f855639265b5541"
instance_type="t2.micro"
key_name="Jenkinskeypem"
}
 

Now we need to perform certain Commands in Terraform:
•	terraform init 
The terraform init command initializes a working directory containing Terraform configuration files. This is the first command that should be run after writing a new Terraform configuration or cloning an existing one from version control. It is safe to run this command multiple times


•	terraform plan
The terraform plan command creates an execution plan, which lets you preview the changes that Terraform plans to make to your infrastructure. By default, when Terraform creates a plan it:
•	Reads the current state of any already-existing remote objects to make sure that the Terraform state is up-to-date.
•	Compares the current configuration to the prior state and noting any differences.
•	Proposes a set of change actions that should, if applied, make the remote objects match the configuration.

•	terraform apply
The terraform apply command executes the actions proposed in a Terraform plan.


•	terraform destory 
The terraform destroy command is a convenient way to destroy all remote objects managed by a particular Terraform configuration.
While you will typically not want to destroy long-lived objects in a production environment, Terraform is sometimes used to manage ephemeral infrastructure for development purposes, in which case you can use terraform destroy to conveniently clean up all of those temporary objects once you are finished with your work.
•	terraform fmt
The terraform fmt command is used to rewrite Terraform configuration files to a canonical format and style. This command applies a subset of the Terraform language style conventions, along with other minor adjustments for readability.







terraform init
                 
terraform plan:
                
terraform apply:

             

The EC2 instance is create on AWS cloud
                             

After I perform terraform apply. I get terraform backup files.It contains the live infrastructure.
•	terraform destroy
                              
To Create a instance using volume:
provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "praveen" {
tags={
Name= "praveen"
}
  ami           = "ami-06f855639265b5541"
  instance_type = "t2.micro"
   root_block_device {
   volume_size=20
}
Count=2    # To Create multiple instance at a time
}
 
In above Case I mentioned count as 2 in main.tf file so that 2 instances is created . If I want delete only particular instance I perform the command as:
   
      terraform destory –auto-approve –target=aws_instance.praveen[0]   #Here praveen is resource name and [0] is index value “0”
        Value represents the count 0--- Instance 1 1--- instance 2
 
One instance is destroyed
   

Again I want To perform terraform apply only one instance is created because one instance is already created.When we give terraform plan it checks with backup file and created one instance
 




                                               Terraform Variables
In Terraform, variables are used to pass values from external sources into Terraform configuration. They provide a way to configure the infrastructure without hardcoding values directly into the configuration. Variables in Terraform are quite important, as you need to hold values of names of instance, configs etc.
Terraform file types include:
1.	main.tf – containing the resource blocks that define the resources to be created in the target cloud platform.
2.	variables.tf – containing the variable declarations used in the resource blocks.
3.	provider.tf – containing the terraform block, s3 backend definition, provider configurations, and aliases.
4.	output.tf – containing the output that needs to be generated on successful completion of “apply” operation.
5.	*.tfvars – containing the environment-specific default values of variables.

     
*There are 3 files
1) provider.tf
                
provider "aws" {
  region = "ap-south-1"
}

2) main.tf
resource "aws_instance" "praveen" {
  tags = {
    Name = "praveen"
  }
  ami           = var.amiid
  instance_type = var.itype
  root_block_device {
    volume_size = var.volume
  }
  count = var.icount

}
            
3) var.tf
 
variable "amiid" {
  description = "This is amiid"
  type        = string
  default     = "ami-06f855639265b5541"
}

variable "itype" {
  type    = string
  default = "t2.micro"
}
variable "volume" {
  type    = number
  default = 10
}
variable "icount" {
  type    = number
  default= 1
}


                                                               Alias in Terraform
What if I need to launch my resources in multiple regions within a single configuration file then Alias variable does this functionality.
 
This error happened because of not providing alias name in the provider.tf file
*Alias Name provided in provider.tf
provider "aws" {
  region = "ap-south-1"
}
provider "aws" {
  region = "us-east-1"
  alias= "nv"
}
 
In main.tf config the alias name to resource

resource "aws_instance" "praveen" {
  tags = {
    Name = "praveen"
  }
  ami           = var.amiid
  instance_type = var.itype
  root_block_device {
    volume_size = var.volume
  }
  count = var.icount

}

resource "aws_instance" "praveenaws" {
 provider=aws.nv
  tags = {
    Name = "N.virginia"
  }
  ami           = var.nv
  instance_type = var.nvitype
  root_block_device {
    volume_size = var.nvvolume
  }
  count = var.nvicount

}
 
Two Resources are created in 2 regions
 

To delete only instance releated to N.virginia region
terraform destroy --auto-approve --target=aws_instance.praveenaws
 

Create a Security Group using Terraform
main.tf
resource "aws_security_group" "mysg" {
  name        = "terraformsg"
  description = "mysggroup"
  ingress {
    from_port    = 22
    to_port      = 22
    protocol     = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port    = 8080
    to_port      = 8080
    protocol     = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port    = 0
    to_port      = 0
    protocol     = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port    = 0
    to_port      = 0
    protocol     = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
 

provider.tf
provider "aws" {
  region = "ap-south-1"
}
                        
Attach Security group to instance:
resource "aws_instance" "myserver"{
tags={
Name="Terrafrom_instance"
}
ami="ami-0522ab6e1ddcc7055"
instance_type="t2.micro"
key_name="Jenkinskeypem"
vpc_security_group_ids= [aws_security_group.mysg.id]
}
 
Ec2 instance is created with security group.
