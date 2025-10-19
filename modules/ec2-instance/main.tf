provider "aws" {
    region="ap-south-1"  
}

resource "aws_instance" "demo" {
    ami = var.ami_value
    instance_type = var.instance_value
  
}

