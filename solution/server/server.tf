resource "aws_instance" "web" {
  ami = (var.ubuntu_version == "18") ? data.aws_ami.ubuntu_18_04.image_id : data.aws_ami.ubuntu_16_04.image_id
  instance_type          = "t2.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  key_name               = var.key_name

  tags = {
    "Identity"    = var.identity
    "Name"        = "Student"
    "Environment" = "Training"
  }
}
