provider "aws" {
region="ap-south-1"           
}                                                 
resource "aws_instance" "flm" {
tags= {
Name="my-terraform-server"              
Project="Zomato"
}
ami="ami-06f855639265b5541"
instance_type="t2.micro"
key_name="Jenkinskeypem"
}
