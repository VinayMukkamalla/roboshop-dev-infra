locals {
  common_name_suffix = "${var.project_name}-${var.environment}"
  mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id.value 
  ami = data.aws_ami.aminame.id
  subnet_id = split("," , data.aws_ssm_parameter.database_subnet_ids)[0].value

  common_tags = {

    Project = var.project_name
    Environment = var.environment
    Terraform = "true"
  }
}