variable "AWS_ID" {}
variable "AWS_SECRET" {}
variable "AWS_REGION" {
  default = "us-east-1"
}
variable "aws_instance_type" {
  default = "t2.nano"
}
variable "aws_ami" {
  default = "ami-8c1be5f6"
}
variable "aws_s3_terraform_state_bucket" {
  default = "letto-terraform"
}

terraform {
  backend "s3" {
    bucket = "letto-terraform"
    key    = "state"
    region = "us-east-1"
  }
}

provider "aws" {
  access_key = "${var.AWS_ID}"
  secret_key = "${var.AWS_SECRET}"
  region     = "${var.AWS_REGION}"
}

resource "aws_instance" "backend_master" {
  ami           = "${var.aws_ami}"
  instance_type = "${var.aws_instance_type}"
  tags = {
    Name = "backend_master"
  }
  provisioner "local-exec" {
    command = "sleep 120; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu --private-key ./deployer.pem -i '${aws_instance.backend_master.public_ip},' master.yml"
}
