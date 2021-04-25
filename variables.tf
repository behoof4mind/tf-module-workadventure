variable "eks_region" {
  description = "EKS solution region"
  default     = "us-east-2"
}

variable "eks_cluster_version" {
  description = "EKS solution version"
  default     = "1.18"
}

variable "environment_name" {
  description = "Environment name (dev, prod etc)"
  default     = "dev"
}

variable "domain_name" {
  description = "Your domain name"
  default     = "workadventure-game.link"
}

variable "worker_group_1_instance_type" {
  description = "t2.small, t2.medium etc"
  default     = "t2.small"
}

variable "worker_group_2_instance_type" {
  description = "t2.small, t2.medium etc"
  default     = "t2.medium"
}

variable "worker_group_1_desired_capacity" {
  type        = number
  default     = 2
}

variable "worker_group_2_desired_capacity" {
  type        = number
  default     = 1
}