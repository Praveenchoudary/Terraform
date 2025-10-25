variable "ami" {
  description = "This is the value of the AMI"
}

variable "instance_type" {
  description = "This is the value of instance_type"
  type        = map(string)

  default = {
    dev   = "t3.micro"
    stage = "t3.medium"
    prod  = "t2.large"
  }
}
