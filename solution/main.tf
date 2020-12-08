#
# DO NOT DELETE THESE LINES UNTIL INSTRUCTED TO!
#
# Your AMI ID is:
#
#     ami-074a777d5cae10210
#
# Your subnet ID is:
#
#     subnet-09abf0e2107aa70f3
#
# Your VPC security group ID is:
#
#     sg-0d883a53e09ab3d8c
#
# Your Identity is:
#
#     terraform-census-ant
#

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

# resource "aws_instance" "web" {
#   ami = (var.ubuntu_version == "18") ? data.aws_ami.ubuntu_18_04.image_id : data.aws_ami.ubuntu_16_04.image_id
#   instance_type = "t2.micro"

#   subnet_id              = var.subnet_id
#   vpc_security_group_ids = var.vpc_security_group_ids

#   tags = {
#     "Identity"    = var.identity
#     "Name"        = "Gabe EC2"
#     "Environment" = "Training"
#   }
# }

module "server" {
  source                 = "./server"
  ubuntu_version         = "16"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  identity               = var.identity
  key_name               = module.keypair.key_name
  private_key            = module.keypair.private_key_pem
}

module "keypair" {
  source  = "mitchellh/dynamic-keys/aws"
  version = "2.0.0"
  path    = "${path.root}/keys"
  name    = "${var.identity}-key"
}
