resource "aws_db_instance" "ss-database" {
  identifier             = "ss-database"
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "8.0.26"
  instance_class         = var.db_instance_class
  username               = var.db_admin_username
  password               = var.db_admin_password
  skip_final_snapshot    = true
  publicly_accessible    = true
  vpc_security_group_ids = [var.db_sg_id]
}