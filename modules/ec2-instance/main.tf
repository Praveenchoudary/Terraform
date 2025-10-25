provider "aws" {
  region = "ap-south-1" 
}
resource "aws_instance" "this" {
  ami                    = var.ami
  instance_type          = var.instance_type

}