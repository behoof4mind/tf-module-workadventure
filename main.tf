//
//terraform {
//  backend "s3" {
//    bucket = "terraform-workadventure-state"
//    key = "workadventure-terraform.tfstate"
//    region = var.eks_region
//    dynamodb_table = "terraform-workadventure-locks"
//    encrypt = true
//  }
//}