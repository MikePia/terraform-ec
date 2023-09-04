provider "aws" {
  region  = var.region
  profile = "default"
}

# create vpc
module "vpc" {
  source                      = "../modules/vpc"
  region                      = var.region
  project_name                = var.project_name
  vpc_cidr                    = var.vpc_cidr
  vpc_subnet_az1_cidr         = var.vpc_subnet_az1_cidr
  vpc_subnet_az2_cidr         = var.vpc_subnet_az2_cidr
  private_app_subnet_az1_cidr = var.private_app_subnet_az1_cidr
  private_app_subnet_az2_cidr = var.private_app_subnet_az2_cidr
  private_data_subnet_az1     = var.private_data_subnet_az1
  private_data_subnet_az2     = var.private_data_subnet_az2

}