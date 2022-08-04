resource "aws_lb" "loadBalancer" {
  internal = false # # falso pois comunica com a internet 
  subnets = [ aws_default_subnet.sub1.id, aws_default_subnet.sub2.id ] 
}