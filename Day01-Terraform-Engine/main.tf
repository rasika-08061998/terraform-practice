resource "aws_instance" "app" {
  ami           = "ami-019715e0d74f695be"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}