provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-019715e0d74f695be"
  instance_type          = "t3.small"
  key_name               = "terraform"
  vpc_security_group_ids = ["sg-0ed51746afe66ef9f"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "AppServer-1", "AppServer-2", "Monitoring server"]
}
