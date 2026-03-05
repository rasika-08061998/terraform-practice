resource "aws_instance" "foreach_ec2" {
  for_each = {
    web = "t2.micro"
    api = "t2.micro"
  }

  ami           = var.ami_id
  instance_type = each.value

  tags = merge(
    local.common_tags,
    {
      Name = "${var.instance_name}-${each.key}"
    }
  )
}