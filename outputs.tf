output "vpc_id" {
  description = "ID of custom VPC is: "
  value       = aws_vpc.eks_vpc.id
}

output "igw_id" {
  value       = aws_internet_gateway.eks_igw.id
  description = "Internet Gateway ID"
}

output "public_subnet_ids" {
  value = aws_subnet.eks_subnet[*].id
}

output "aws_key_pair_id" {
  value       = aws_key_pair.custom_key_pair.id
  description = "ID of newly created Key Pair"
}

output "eks-endpoint" {
  value       = aws_eks_cluster.eks.endpoint
  description = "EKS Endpoint"
}

output "kubeconfig-certificate-authority-data" {
  value       = aws_eks_cluster.eks.certificate_authority[0].data
  description = "Kubeconfig CA Data"
}

output "aws_eks_cluster" {
  value       = aws_eks_cluster.eks.id
  description = "EKS Cluster ID"
}

output "node_group_id" {
  value = aws_eks_node_group.eks.id
  description = "EKS Node Group ID"
}