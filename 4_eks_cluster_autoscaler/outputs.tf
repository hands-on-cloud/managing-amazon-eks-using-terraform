output "eks_ca_iam_role_arn" {
  value = aws_iam_role.cluster_autoscaler.arn
  description = "AWS IAM role ARN for EKS Cluster Autoscaler"
}
