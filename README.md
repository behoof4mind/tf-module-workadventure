# Terraform module for workadventure app
This module can be used to prepare EC2 instances with Amazon RDS. Was developed as test exercise for [**workadventure-eks**](https://github.com/behoof4mind/workadventure-eks) project

## How to use
#### Add environment variables
Bash example:
```shell
AWS_DEFAULT_REGION="<YOUR APP REGION>"
AWS_ACCESS_KEY_ID="<YOUR AWS_ACCESS_KEY_ID>"
AWS_SECRET_ACCESS_KEY="<YOUR AWS_SECRET_ACCESS_KEY>"
```
Fish example:
```shell
set -Ux AWS_DEFAULT_REGION <YOUR APP REGION>
set -Ux AWS_ACCESS_KEY_ID <YOUR AWS_ACCESS_KEY_ID>
set -Ux AWS_SECRET_ACCESS_KEY <YOUR AWS_SECRET_ACCESS_KEY>
```

Create main.tf file
```yaml
module "webserver_cluster" {
  source                          = "github.com/behoof4mind/tf-module-workadventure?ref=0.0.1" # specify module version here
  eks_region                      = "us-east-2"
  eks_cluster_version             = "1.18"
  environment_name                = "dev"
  domain_name                     = "workadventure-game.link"
  worker_group_1_instance_type    = "t2.small"
  worker_group_2_instance_type    = "t2.medium"
  worker_group_1_desired_capacity = 2
  worker_group_2_desired_capacity = 1

```

Make init
```shell
terraform init
```

Apply changes
```shell
terraform apply
```

## Contributing

Thanks for considering contributing! There’s information about how to [get started with Workadventure module here](CONTRIBUTE.md).

## License

[The MIT License (MIT)](LICENSE.md)

Copyright © 2021 [Denis Lavrushko](https://dlavrushko.de)