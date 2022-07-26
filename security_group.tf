resource "aws_security_group" "ec2" {
  name = "ec2"
  description = "Allow public inbound and outbound traffic"

  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}