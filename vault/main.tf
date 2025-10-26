provider "aws" {
  region = "ap-south-1"
}

provider "vault" {
  address = "http://public-ip-of-server:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "your-role-id"
      secret_id = "your-secret-id"
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "kv" // change it according to your mount
  name  = "test-secret" // change it according to your secret
}

resource "aws_instance" "example" {
  ami = "ami-02d26659fd82cf299" 
  instance_type = "t2.micro"

  tags = {
    secret = data.vault_kv_secret_v2.example.data["username"]
  }
} 
