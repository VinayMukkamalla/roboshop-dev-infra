#  resource "aws_security_group_rule" "frontend_frontend_alb" {
#   type = "ingress"
#   security_group_id = module.sg[9].sg_id 
#   source_security_group_id  = module.sg[11].sg_id
#   from_port = 80
#   protocol = "tcp"
#   to_port = 80
#  }

 resource "aws_security_group_rule" "backend_alb_bastion" {
  type = "ingress"
  security_group_id = local.backend_alb_sg_id  # backend alb sg
  source_security_group_id  = local.bastion_sg_id  # bastion alb sg
  from_port = 80
  protocol = "tcp"
  to_port = 80
 }

 # bastion host ingress rule to allow ssh from public
 resource "aws_security_group_rule" "bastion_laptop" {
  type = "ingress"
  security_group_id = local.bastion_sg_id  # bastion sg id
  cidr_blocks =  ["0.0.0.0/0"]
  from_port = 22
  protocol = "tcp"
  to_port = 22
 }

  # mongodb allowing bastion host
  resource "aws_security_group_rule" "bastion_mongodb" {
  type = "ingress"
  security_group_id = local.mongodb_sg_id  # mongodb sg_id 
  source_security_group_id  = local.bastion_sg_id
  from_port = 22
  protocol = "tcp"
  to_port = 22
 }

 # redis allowing bastion host
  resource "aws_security_group_rule" "bastion_redis" {
  type = "ingress"
  security_group_id = local.redis_sg_id  # redis sg_id 
  source_security_group_id  = local.bastion_sg_id
  from_port = 22
  protocol = "tcp"
  to_port = 22
 }

 # rabbitmq allowing bastion host
  resource "aws_security_group_rule" "bastion_rabbitmq" {
  type = "ingress"
  security_group_id = local.rabbitmq_sg_id  # rabbitmq sg_id 
  source_security_group_id  = local.bastion_sg_id
  from_port = 22
  protocol = "tcp"
  to_port = 22
 }

 # mysql allowing bastion host
  resource "aws_security_group_rule" "bastion_mysql" {
  type = "ingress"
  security_group_id = local.mysql_sg_id  # mysql sg_id 
  source_security_group_id  = local.bastion_sg_id
  from_port = 22
  protocol = "tcp"
  to_port = 22
 }

   resource "aws_security_group_rule" "bastion_catalogue" {
  type = "ingress"
  security_group_id = local.catalogue_sg_id  # catalogue_sg_id 
  source_security_group_id  = local.bastion_sg_id
  from_port = 22
  protocol = "tcp"
  to_port = 22
 }

   resource "aws_security_group_rule" "catalogue_mongodb" {
  type = "ingress"
  security_group_id = local.mongodb_sg_id  # mongodb sg_id 
  source_security_group_id  = local.catalogue_sg_id
  from_port = 22
  protocol = "tcp"
  to_port = 22
 }
