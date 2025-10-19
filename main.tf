module "ec2" {
    source = "./modules/ec2-instance"
    ami_value = "ami-02d26659fd82cf299"
    instance_value = "t3.micro"
  
}

module "dev-ec2" {
    source = "./modules/ec2-instance"
    ami_value = "ami-02d26659fd82cf299"
    instance_value = "t3.medium"
  
}