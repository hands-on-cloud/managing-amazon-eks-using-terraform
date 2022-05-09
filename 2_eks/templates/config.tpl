apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: ${certificate_data}
    server: ${cluster_endpoint}
  name: arn:aws:eks:${aws_region}:${account_id}:cluster/${cluster_name}
contexts:
- context:
    cluster: arn:aws:eks:${aws_region}:${account_id}:cluster/${cluster_name}
    user: arn:aws:eks:${aws_region}:${account_id}:cluster/${cluster_name}
  name: arn:aws:eks:${aws_region}:${account_id}:cluster/${cluster_name}
current-context: arn:aws:eks:${aws_region}:${account_id}:cluster/${cluster_name}
kind: Config
preferences: {}
users:
- name: arn:aws:eks:${aws_region}:${account_id}:cluster/${cluster_name}
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1alpha1
      command: aws
      args:
        - --region
        - ${aws_region}
        - eks
        - get-token
        - --cluster-name
        - ${cluster_name}
