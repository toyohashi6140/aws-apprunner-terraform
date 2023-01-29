variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "region" {
    type = string
    nullable = false
    default = "ap-northeast-1"
}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = var.region
}

resource "aws_ecr_repository" "default" {
  name = "default-repository"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}