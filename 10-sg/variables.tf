variable "project_name" {
  type = string
  default = "roboshop"
}

variable "environment" {
  type = string
  default = "dev"
}

variable "sg_names" {
  type = list 
  default = [

      #databases
      "mongodb","redis","mysql","rabbitmq",
      
      #backend
      "catalogue","user","cart","shipping","payment",

      #frontend
      "frontend",

      #bastion
      "bastion",

      #frontend-ALB
      "frontend_alb",

      # backend-ALB
      "backend_alb",

      #openvpn
      "open_vpn"


    ]
}