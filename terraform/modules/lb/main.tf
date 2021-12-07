

resource "aws_lb" "ss_lb" {
    name = "ss-app-lb"
    internal  = false
    load_balancer_type = "application"
    security_groups = [var.public_security_group_id]
    
    subnets = var.public_subnet_ids

}

# resource "aws_lb_listener" "ss_alb_listener" {
#     load_balancer_arn = aws_lb.ss_lb.arn
#     port = "80"
#     protocol = "HTTP"
#     ssl_policy = "ELBSecurityPolicy-2015-05"
# }


resource "aws_lb_target_group" "ss_target_group" {
  name     = "ss-target-group"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "alb"
}

resource "aws_lb_target_group_attachment" "ss_lb_target_group_attachment" {
  target_group_arn = "${aws_lb_target_group.ss_target_group.arn}"
  target_id       = "${aws_lb.ss_lb.id}"
}