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
