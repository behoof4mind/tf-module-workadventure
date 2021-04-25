module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "workadventrure"
  cluster_version = var.eks_cluster_version
  subnets         = module.vpc.private_subnets

  tags = {
    Service     = "workadventrure"
    Environment = var.environment_name
  }

  vpc_id = module.vpc.vpc_id

  workers_group_defaults = {
    root_volume_type = "gp2"
  }

  worker_groups = [
    {
      name                          = "worker-group-1"
      instance_type                 = var.worker_group_1_instance_type
      additional_userdata           = "echo foo bar"
      asg_desired_capacity          = var.worker_group_1_desired_capacity
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
    },
    {
      name                          = "worker-group-2"
      instance_type                 = var.worker_group_2_instance_type
      additional_userdata           = "echo foo bar"
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_two.id]
      asg_desired_capacity          = var.worker_group_2_desired_capacity
    },
  ]
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}