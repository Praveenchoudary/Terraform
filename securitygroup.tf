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

#provider.tf
provider.tf
provider "aws" {
  region = "ap-south-1"
}
                        
#Attach Security group to instance
#sg.tf
resource "aws_instance" "myserver"{
tags={
Name="Terrafrom_instance"
}
ami="ami-0522ab6e1ddcc7055"
instance_type="t2.micro"
key_name="Jenkinskeypem"
vpc_security_group_ids= [aws_security_group.mysg.id]
}
