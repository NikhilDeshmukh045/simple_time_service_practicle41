provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  name    = "eks-vpc"
  cidr    = var.vpc_cidr

  azs             = slice(data.aws_availability_zones.available.names, 0, 2)
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
    "kubernetes.io/role/elb"                        = "1"
    "kubernetes.io/role/internal-elb"               = "1"
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0" # Latest stable at time of writing

  cluster_name    = var.eks_cluster_name
  cluster_version = var.eks_cluster_version
  cluster_endpoint_public_access = true

  vpc_id  = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  enable_irsa = true

  eks_managed_node_groups = {
    default = {
      desired_capacity = var.eks_desired_capacity
      min_capacity     = var.eks_min_capacity
      max_capacity     = var.eks_max_capacity

      instance_types = var.eks_node_instance_types

      subnet_ids = module.vpc.private_subnets

      tags = {
        Name = "eks-node-group"
      }
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
