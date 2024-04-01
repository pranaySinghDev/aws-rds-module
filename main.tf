locals {
  extract_resource_name = lower("${var.common_name_prefix}-${var.environment}")
}


resource "aws_db_subnet_group" "db-subnet-group" {
  name       = "${local.extract_resource_name}-db-subnet-group"
  subnet_ids = [var.subnet-db-a-id, var.subnet-db-b-id]

  tags = merge(
    {
      "Name" = format("%s", "${local.extract_resource_name}-db-subnet-group")
    },
    {
      environment = var.environment
    },
    var.tags,
  )
}

resource "random_password" "password_postgres" {
  length  = 16
  special = false
}
resource "aws_db_parameter_group" "rds_parameter_group" {
  name   = "rds-parameter-group"
  family = "postgres16"  # For example, "mysql5.7" for MySQL 5.7, "postgres13" for PostgreSQL 13, etc.
  description = "Custom parameter group for RDS"

  parameter {
    name  = "rds.force_ssl"
    value = "0"
    apply_method = "immediate"  # Can be "immediate" or "pending-reboot"
  }

  # Include any tags here
  tags = {
    Name = "rds-parameter-group"
  }
}


resource "aws_db_instance" "db" {
  identifier              = "${local.extract_resource_name}-db"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  max_allocated_storage   = 40
  engine                  = "postgres"
  username                = "postgres"
  password                = random_password.password_postgres.result
  db_subnet_group_name    = aws_db_subnet_group.db-subnet-group.name
  vpc_security_group_ids  = [var.db-sg-id , aws_security_group.rds_ec2.id , aws_security_group.rds_ec2_worker_node.id]
  storage_encrypted       = true
  db_name                 = "postgres"
  backup_retention_period = 7
  backup_window           = "20:00-21:00"
  maintenance_window      = "Sat:23:00-Sun:03:00"
  monitoring_interval = var.environment == "prod" || var.environment == "production" ? 60 : 0
  performance_insights_enabled = var.environment == "prod" || var.environment == "production" ? true : false
  deletion_protection     = true
  multi_az = true
  publicly_accessible    = false
  skip_final_snapshot = var.environment == "prod" || var.environment == "production" ? false : true
  parameter_group_name = aws_db_parameter_group.rds_parameter_group.name
  tags = merge(
    {
      "Name" = format("%s", "${local.extract_resource_name}-db")
    },
    {
      environment = var.environment
    },
    var.tags,
  )

}

resource "aws_security_group" "ec2_rds" {
  name   = "ec2-rds"
  vpc_id = var.vpc_id

  tags = {
    Name = "ec2-rds"
  }
}

resource "aws_security_group" "rds_ec2" {
  name   = "rds-ec2"
  vpc_id = var.vpc_id

  tags = {
    Name = "rds-ec2"
  }
}

resource "aws_security_group" "rds_ec2_worker_node" {
  name   = "rds-ec2"
  vpc_id = var.vpc_id

  tags = {
    Name = "rds-ec2"
  }
}

resource "aws_security_group_rule" "ec2_to_rds" {
  type              = "egress"
  from_port         = 5432
  to_port           = 5432
  protocol          = "tcp"
  security_group_id = aws_security_group.ec2_rds.id
  source_security_group_id = aws_security_group.rds_ec2.id
}

resource "aws_security_group_rule" "rds_to_ec2" {
  type                     = "ingress"
  from_port                = 5432
  to_port                  = 5432
  protocol                 = "tcp"
  security_group_id        = aws_security_group.rds_ec2.id
  source_security_group_id = aws_security_group.ec2_rds.id
}

resource "aws_security_group_rule" "rds_to_ec2_worker_node" {
  type                     = "ingress"
  from_port                = 5432
  to_port                  = 5432
  protocol                 = "tcp"
  security_group_id        = aws_security_group.rds_ec2_worker_node.id
  source_security_group_id = var.worker_node_sg
}



