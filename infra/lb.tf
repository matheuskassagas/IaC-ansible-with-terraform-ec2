resource "aws_lb" "loadBalancer" {
  internal = false # # falso pois comunica com a internet 
  subnets = [ aws_default_subnet.sub1.id, aws_default_subnet.sub2.id ] 
  count = var.producao ? 1 : 0
}

resource "aws_lb_target_group" "alvoLoadBalancer" {
  name     = "this"
  port     = "8000"
  protocol = "HTTP" 
  vpc_id   = aws_default_vpc.default.id # # VPC DEFAULT AWS
  count = var.producao ? 1 : 0
}

resource "aws_lb_listener" "entradaLoadBalancer" {
  load_balancer_arn = aws_lb.loadBalancer[0].arn
  port = "8000"
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_autoscaling_group.alvoLoadBalancer[0].arn
  }
  count = var.producao ? 1 : 0
}