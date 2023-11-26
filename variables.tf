variable "name" {
  type = string
  default = "nginx-webapp"
  description = "Name of the EC2 Instance"
}
variable "size" {
  type = string
  description = "small, medium or large"
  default = "small"
}
variable "key_name" {
  type = string
  description = "Name of AWS Key Pair to use for ssh access to EC2 instance"
}
variable "environment" {
  type = string
  default = "Production"
  description = "production, staging, development"
}
variable "EC2-Token" {
  type = string
  description = "private key to access EC2 Instance"
}
variable "security_groups" {
  type = list
  default = ["default"]
  description = "List of security groups to attach to EC2 Instance"
}
variable "ami" {
  type = string
  default = "ami-0230bd60aa48260c6"
}

locals {
  # convert size to intance_type
  instance_type = lookup(local.sizemap, var.size)
}
locals {
  # Size to intance type map
  sizemap = {
    small = "t2.micro"
    medium = "t3.micro"
    large = "t2.nano"
  }
}