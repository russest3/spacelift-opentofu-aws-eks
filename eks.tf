module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = ">= 19.0.0"
  name    = var.cluster_name
  kubernetes_version = var.kubernetes_version
  region = var.aws_region
  endpoint_public_access = true
  # deletion_protection = true
  enable_cluster_creator_admin_permissions = true
  compute_config = {
    enabled = true
    node_pools = ["general_purpose"]
  }
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
}
