variable "region" {
  default = "us-east-1"
}

variable "image_uri" {
  description = "URI da imagem do Lambda no ECR"
  type        = string
}