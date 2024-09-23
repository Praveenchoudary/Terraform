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
