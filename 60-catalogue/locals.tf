locals {
  ami_id = data.aws_ami.aminame.id
  catalogue_sg_id = data.aws_ssm_parameter.catalogue_sg_id.id
  private_subnet_id = split(",", data.aws_ssm_parameter.private_subnet_ids.value)[0]
  common_name_suffix = "${var.project_name}-${var.environment}"

  common_tags = {
    Project = var.project_name
    environment = var.environment
    Terraform = "true"
  }
}