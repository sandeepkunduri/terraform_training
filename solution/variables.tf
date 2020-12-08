variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "us-east-1"
}
variable "identity" {
  type        = string
  description = "Identity"
}
variable "subnet_id" {
  type        = string
  description = "Subnet ID for my EC2"
}
variable "vpc_security_group_ids" {
  type        = list
  description = "List of Security to apply to my EC2s"
}
variable "ubuntu_version" {
  type    = string
  default = "18"
}
