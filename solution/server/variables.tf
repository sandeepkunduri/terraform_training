variable subnet_id {}
variable vpc_security_group_ids {
  type = list
}
variable identity {}
variable key_name {}
variable private_key {}

variable ubuntu_version {
    type = string
    description = "Ubuntu Version.  Example: 16, 18"
    default = 18
}
