output "instance_type" {
  description = "AWS Instance type used: "
  value       = aws_instance.web.instance_type
}

output "instance_id" {
  description = "AWS Instance ID: "
  value       = aws_instance.web.id
}

output "ami_id" {
  description = "AWS Instance AMI ID: "
  value       = aws_instance.web.ami
}

output "instance_public_ip" {
  description = "AWS Instance Public IP: "
  value       = aws_instance.web.public_ip
}

output "instance_name" {
  description = "AWS Instance Name: "
  value       = aws_instance.web.tags["Name"]
}

output "aws_region" {
  description = "AWS Region: "
  value       = var.aws_region
}

