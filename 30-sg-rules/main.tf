#  resource "aws_security_group_rule" "frontend_frontend_alb" {
#   type = "ingress"
#   security_group_id = module.sg[9].sg_id 
#   source_security_group_id  = module.sg[11].sg_id
#   from_port = 80
#   protocol = "tcp"
#   to_port = 80
#  }

  # mongodb allowing bastion host
  resource "aws_security_group_rule" "bastion_mongodb" {
    type = "ingress"
    security_group_id = local.mongodb_sg_id  # mongodb sg_id 
    source_security_group_id  = local.bastion_sg_id
    from_port = 22
    protocol = "tcp"
    to_port = 22
 }

  resource "aws_security_group_rule" "catalogue_mongodb" {
    type = "ingress"
    security_group_id = local.mongodb_sg_id  # mongodb sg_id 
    source_security_group_id  = local.catalogue_sg_id # catalogue
    from_port = 27017
    protocol = "tcp"
    to_port = 27017
 }

  resource "aws_security_group_rule" "user_mongodb" {
    type = "ingress"
    security_group_id = local.mongodb_sg_id  # mongodb sg_id 
    source_security_group_id  = local.user_sg_id  # user
    from_port = 27017
    protocol = "tcp"
    to_port = 27017
 }

  resource "aws_security_group_rule" "user_redis" {
    type = "ingress"
    security_group_id = local.redis_sg_id  # redis sg_id 
    source_security_group_id  = local.user_sg_id  # user
    from_port = 6379
    protocol = "tcp"
    to_port = 6379
 }

  resource "aws_security_group_rule" "cart_redis" {
    type = "ingress"
    security_group_id = local.redis_sg_id  # redis sg_id 
    source_security_group_id  = local.cart_sg_id  # cart
    from_port = 6379
    protocol = "tcp"
    to_port = 6379
 }

  resource "aws_security_group_rule" "shipping_mysql" {
    type = "ingress"
    security_group_id = local.redis_sg_id  # redis sg_id 
    source_security_group_id  = local.shipping_sg_id  # shipping
    from_port = 3306
    protocol = "tcp"
    to_port = 3306
 }

  resource "aws_security_group_rule" "payment_rabbitmq" {
    type = "ingress"
    security_group_id = local.rabbitmq_sg_id  # rabbitmq sg_id 
    source_security_group_id  = local.payment_sg_id  # payment
    from_port = 5672
    protocol = "tcp"
    to_port = 5672
 }


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


  resource "aws_security_group_rule" "bastion_user" {
    type = "ingress"
    security_group_id = local.user_sg_id  # user 
    source_security_group_id  = local.bastion_sg_id
    from_port = 22
    protocol = "tcp"
    to_port = 22
 }


  resource "aws_security_group_rule" "bastion_cart" {
    type = "ingress"
    security_group_id = local.cart_sg_id  # cart  
    source_security_group_id  = local.bastion_sg_id
    from_port = 22
    protocol = "tcp"
    to_port = 22
 }



  resource "aws_security_group_rule" "bastion_shipping" {
    type = "ingress"
    security_group_id = local.shipping_sg_id  # shipping 
    source_security_group_id  = local.bastion_sg_id
    from_port = 22
    protocol = "tcp"
    to_port = 22
 }

 
  resource "aws_security_group_rule" "bastion_payment" {
    type = "ingress"
    security_group_id = local.payment_sg_id  # payment 
    source_security_group_id  = local.bastion_sg_id
    from_port = 22
    protocol = "tcp"
    to_port = 22
 }



  resource "aws_security_group_rule" "catalogue_backend_alb" {
    type = "ingress"
    security_group_id = local.catalogue_sg_id  # catalogue sg_id 
    source_security_group_id  = local.backend_alb_sg_id
    from_port = 8080
    protocol = "tcp"
    to_port = 8080
 }

  resource "aws_security_group_rule" "user_backend_alb" {
    type = "ingress"
    security_group_id = local.user_sg_id  # user sg_id 
    source_security_group_id  = local.backend_alb_sg_id
    from_port = 8080
    protocol = "tcp"
    to_port = 8080
 }

  resource "aws_security_group_rule" "cart_backend_alb" {
    type = "ingress"
    security_group_id = local.cart_sg_id  # cart sg_id 
    source_security_group_id  = local.backend_alb_sg_id
    from_port = 8080
    protocol = "tcp"
    to_port = 8080
 }

  resource "aws_security_group_rule" "shipping_backend_alb" {
    type = "ingress"
    security_group_id = local.shipping_sg_id  # shipping sg_id 
    source_security_group_id  = local.backend_alb_sg_id
    from_port = 8080
    protocol = "tcp"
    to_port = 8080
 }


  resource "aws_security_group_rule" "payment_backend_alb" {
    type = "ingress"
    security_group_id = local.payment_sg_id  # payment sg_id 
    source_security_group_id  = local.backend_alb_sg_id
    from_port = 8080
    protocol = "tcp"
    to_port = 8080
 }


  resource "aws_security_group_rule" "catalogue_cart" {
    type = "ingress"
    security_group_id = local.catalogue_sg_id  # catalogue 
    source_security_group_id  = local.cart_sg_id # cart
    from_port = 8080
    protocol = "tcp"
    to_port = 8080
 }

  resource "aws_security_group_rule" "cart_shipping" {
    type = "ingress"
    security_group_id = local.cart_sg_id  # cart 
    source_security_group_id  = local.shipping_sg_id # shipping
    from_port = 8080
    protocol = "tcp"
    to_port = 8080
 }

  resource "aws_security_group_rule" "user_payment" {
    type = "ingress"
    security_group_id = local.user_sg_id  # user 
    source_security_group_id  = local.payment_sg_id # payment
    from_port = 8080
    protocol = "tcp"
    to_port = 8080
 }

  resource "aws_security_group_rule" "cart_payment" {
    type = "ingress"
    security_group_id = local.cart_sg_id  # cart 
    source_security_group_id  = local.payment_sg_id # payment
    from_port = 8080
    protocol = "tcp"
    to_port = 8080
 }


  resource "aws_security_group_rule" "frontend_alb_public" {
    type              = "ingress"
    security_group_id = local.frontend_alb_sg_id
    cidr_blocks = ["0.0.0.0/0"]
    from_port         = 443
    protocol          = "tcp"
    to_port           = 443
}

  resource "aws_security_group_rule" "backend_alb_frontend" {
    type = "ingress"
    security_group_id = local.backend_alb_sg_id  # backend_alb 
    source_security_group_id  = local.frontend_sg_id # frotend
    from_port = 80
    protocol = "tcp"
    to_port = 80
 }

  resource "aws_security_group_rule" "frontend_frontend_alb" {
    type = "ingress"
    security_group_id = local.frontend_sg_id  # frotend
    source_security_group_id  = local.frontend_alb_sg_id # frontend_alb
    from_port = 80
    protocol = "tcp"
    to_port = 80
 }