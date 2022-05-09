locals {
  eks_cluster_name  = data.terraform_remote_state.eks.outputs.eks_cluster_name
}

data "aws_eks_cluster" "eks_cluster" {
  name = local.eks_cluster_name
}

# Obtain TLS certificate for the OIDC provider
data "tls_certificate" "tls" {
  url = data.aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}

# Create OIDC Provider using TLS certificate
resource "aws_iam_openid_connect_provider" "eks_ca_oidc_provider" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.tls.certificates[0].sha1_fingerprint]
  url             = data.aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}
