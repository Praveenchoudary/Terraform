provider "aws" {
  region = "ap-south-1"
}

# Calling the EC2 module
module "my_ec2_instance" {
  source = "./modules/ec2-instance"

  ami           = var.ami
  instance_type = lookup(var.instance_type, terraform.workspace, "t3.micro")
}
