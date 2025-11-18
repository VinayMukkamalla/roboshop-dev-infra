locals {
  ami_id = data.aws_ami.aminame.id
  catalogue_sg_id = data.aws_ssm_parameter.catalogue_sg_id.value
  private_subnet_id = split(",", data.aws_ssm_parameter.private_subnet_ids.value)[0]
  private_subnet_id_2 = split(",", data.aws_ssm_parameter.private_subnet_ids.value)[1]
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  backend_alb_listener_arn = data.aws_ssm_parameter.backend_alb_listener_arn.value
  common_name_suffix = "${var.project_name}-${var.environment}"


  common_tags = {
    Project = var.project_name
    environment = var.environment
    Terraform = "true"
  }
}