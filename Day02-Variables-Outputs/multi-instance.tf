resource "aws_instance" "multi_ec2" {
  count = 1

  ami           = var.ami_id
  instance_type = var.instance_type

  tags = merge(
    local.common_tags,
    {
      Name = "${var.instance_name}-${count.index}"
    }
  )
}