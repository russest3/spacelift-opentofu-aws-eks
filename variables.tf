variable "aws_region" {
  description = "AWS region to create resources in"
  type        = string
  default     = "us-east-2"
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "eks-cluster"
}

variable "kubernetes_version" {
  description = "Kubernetes Version"
  type = string
  default = "1.33"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "Public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "private_subnets" {
  description = "Private subnet CIDRs"
  type        = list(string)
  default     = ["10.0.10.0/24", "10.0.11.0/24"]
}

variable "node_group_instance_type" {
  description = "Instance type for managed node group"
  type        = string
#   default     = "t3.medium"
  default     = "t2.micro"
}

variable "node_group_desired_capacity" {
  description = "Desired capacity for managed node group"
  type        = number
  default     = 2
}
