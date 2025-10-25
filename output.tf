output "ec2_instance_id" {
  description = "ID of the created EC2 instance"
  value       = module.my_ec2_instance.instance_id
}

output "ec2_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = module.my_ec2_instance.instance_public_ip
}

output "ec2_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = module.my_ec2_instance.instance_private_ip
}
