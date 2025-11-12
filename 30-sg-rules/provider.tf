terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.16.0"
    }
  }

  backend "s3" {
    bucket = "project-state-file-6250"
    key = "roboshop-dev-sg-rules"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true
  }
}

provider "aws"  {
  region = "us-east-1"
  # Configuration options

}