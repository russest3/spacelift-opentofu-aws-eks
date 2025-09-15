module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = ">= 19.0.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.28"          # adjust as desired; ensure your AWS supports this version
  subnets         = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id

  # Control plane logging (optional)
  cluster_enabled_log_types = ["api", "audit", "authenticator"]

  # Managed node group example
  manage_aws_auth = true

  node_groups = {
    default = {
      desired_capacity = var.node_group_desired_capacity
      max_capacity     = var.node_group_desired_capacity + 1
      min_capacity     = 1

      instance_types = [var.node_group_instance_type]
      key_name       = null        # provide an EC2 key pair name if you want ssh access
      disk_size      = 20

      # Optional labels/tags
      labels = {
        role = "worker"
      }

      tags = {
        Name = "${var.cluster_name}-node"
      }
    }
  }

  tags = {
    "Name" = var.cluster_name
  }

  # Optional: enable Fargate if you want (commented out)
  # enable_fargate = true
}
