#provider.tf
provider "aws" {
  region = "ap-south-1"
}
provider "aws" {
  region = "us-east-1"
  alias= "nv"
}

#main.tf
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

#var.tf
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

variable "nvid" {
  description = "This is amiid"
  type        = string
  default     = "ami-06f855639265b5541"
}

variable "nvitype" {
  type    = string
  default = "t2.micro"
}
variable "nvvolume" {
  type    = number
  default = 10
}
variable "nvicount" {
  type    = number
  default= 1
}
