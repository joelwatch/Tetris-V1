resource "aws_db_instance" "postgres" {
  identifier             = "${var.resource_prefix}-${var.db_instance_identifier}"
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  instance_class         = var.db_instance_class
  allocated_storage      = var.allocated_storage
  engine                 = "postgres"
  engine_version         = var.engine_version
  skip_final_snapshot    = var.skip_final_snapshot
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
}

resource "aws_security_group" "rds_sg" {
  name        = "${var.resource_prefix}-${var.db_instance_identifier}-sg"
  description = "Security group for RDS PostgreSQL"
  ...
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "${var.resource_prefix}-${var.db_instance_identifier}-subnet-group"
  subnet_ids = aws_subnet.rds_subnets[*].id
}