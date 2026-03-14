
module "vpc" {
  source = "./modules/vpc"
  env    = var.env
}

module "ec2" {
  source        = "./modules/ec2"
  env           = var.env
  instance_type = var.instance_type
}

module "s3" {
  source      = "./modules/s3"
  env         = var.env
  bucket_name = var.bucket_name
}