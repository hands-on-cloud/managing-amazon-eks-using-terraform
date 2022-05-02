#obtain TLS certificate for the OIDC provider
data "tls_certificate" "tls" {
  url = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}


#create OIDC Provider using TLS certificate
resource "aws_iam_openid_connect_provider" "eks_ca_oidc_provider" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.tls.certificates[0].sha1_fingerprint]
  url             = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}
