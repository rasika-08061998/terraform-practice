variable "aws_region" {
  type        = string
  description = "AWS region to deploy resources in."
  default     = "ap-south-1"
}

variable "ami_id" {
  type        = string
  description = "AMI ID to use for the EC2 instance."
  default     = "ami-019715e0d74f695be"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type."
  default     = "t2.micro"
}

variable "instance_name" {
  type        = string
  description = "Name of the EC2 instance."
  default     = "my-ec2-instance"
}