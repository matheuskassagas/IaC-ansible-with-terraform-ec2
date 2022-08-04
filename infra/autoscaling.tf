resource "aws_autoscaling_group" "grupo" {
  availability_zones = [ "${var.region_aws}a", "${var.region_aws}b" ]
  name = var.nomeGrupo
  max_size = var.maximo
  min_size = var.minimo
  launch_template {
    id = aws_launch_template.maquina.id
    version = "$Latest"
  }
  target_group_arns = [ aws_lb_target_group.alvoLoadBalancer.arn ]
}

resource "aws_autoscaling_policy" "this" {
 name = "terraform-escala"
 autoscaling_group_name = var.nomeGrupo
 policy_type = "TargetTrackingScaling"
 target_trackingtarget_tracking_configuration {
   predefined_metric_type = "ASGAverageCPUUtilization"

 } 
 target_value = 50.0

}