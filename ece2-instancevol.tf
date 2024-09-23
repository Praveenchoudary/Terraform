#To Create a instance using volume
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

