resource "aws_instance" "app" {

  ami           = "ami-0b6c6ebed2801a5cb"
  instance_type = var.instance_type

  tags = {
    Name = "${var.env}-server"
  }

  lifecycle {
    prevent_destroy = true
  }

}