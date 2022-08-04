resource "aws_defautl_subnet" "sub1" {
  availability_zones = "${var.region_aws}a"
}

resource "aws_defautl_subnet" "sub2" {
  availability_zones = "${var.region_aws}b"
}