output "eks_cluster_id" {
  description = "The EKS cluster ID"
  value       = aws_eks_cluster.eks-cluster.id
}
