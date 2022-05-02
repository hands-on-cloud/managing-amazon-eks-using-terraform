#Fetch the policy document which allows Federated Access to the IAM Cluster Autoscaler:
data "aws_iam_policy_document" "eks_ca_sts_policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    condition {
      test     = "StringEquals"
      variable = "${replace(aws_iam_openid_connect_provider.eks_ca_oidc_provider.url, "https://", "")}:sub"
      values   = ["system:serviceaccount:kube-system:cluster-autoscaler"]
    }

    principals {
      identifiers = [aws_iam_openid_connect_provider.eks_ca_oidc_provider.arn]
      type        = "Federated"
    }
  }
}

#create an IAM Role with the above fetched policy document:
resource "aws_iam_role" "eks_ca_iam_role" {
  assume_role_policy = data.aws_iam_policy_document.eks_ca_sts_policy.json
  name               = "eks-cluster-autoscaler-role"
}


#create IAM policy for the above role to allow ASG operations:
resource "aws_iam_policy" "eks_ca_iam_policy" {
  name = "eks-cluster-autoscaler-role-policy"

  policy = jsonencode({
    Statement = [{
      Action = [
                "autoscaling:DescribeAutoScalingGroups",
                "autoscaling:DescribeAutoScalingInstances",
                "autoscaling:DescribeLaunchConfigurations",
                "autoscaling:DescribeTags",
                "autoscaling:SetDesiredCapacity",
                "autoscaling:TerminateInstanceInAutoScalingGroup",
                "ec2:DescribeLaunchTemplateVersions"
            ]
      Effect   = "Allow"
      Resource = "*"
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "eks_ca__iam_policy_attach" {
  role       = aws_iam_role.eks_ca_iam_role.name
  policy_arn = aws_iam_policy.eks_ca_iam_policy.arn
}
