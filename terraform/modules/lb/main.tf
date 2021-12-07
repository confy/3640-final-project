resource "aws_lb" "ss_lb" {
    name = "ss-app-lb"
    internal  = false
    load_balancer_type = "application"
    security_groups = [var.public_security_group_id]
    subnets = var.public_subnet_ids
}