output "target_group_arn" {
    value = aws_lb_target_group.ss_target_group.arn
}

output "alb_hostname" {
    value = aws_lb.ss_lb.dns_name
}