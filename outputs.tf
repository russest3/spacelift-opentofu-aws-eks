output "cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_id
}

output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = module.eks.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  description = "Base64 encoded cluster CA cert"
  value       = module.eks.cluster_certificate_authority_data
}

output "kubeconfig_command_hint" {
  description = "How to get kubectl config locally"
  value       = "Run: aws eks update-kubeconfig --region ${var.aws_region} --name ${module.eks.cluster_id}"
}
