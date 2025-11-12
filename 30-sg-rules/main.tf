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
  security_group_id = local.bastion_sg_id  # bastion alb sg
  cidr_blocks =  ["0.0.0.0/0"]
  from_port = 22
  protocol = "tcp"
  to_port = 22
 }
