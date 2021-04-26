# Terraform module for workadventure app
This module can be used to prepare AWS EKS solution for [workadventure](https://workadventu.re). Was developed as test exercise for [**workadventure-eks**](https://github.com/behoof4mind/workadventure-eks) project

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
  source                          = "github.com/behoof4mind/tf-module-workadventure?ref=0.0.9"
  eks_region                      = "us-east-2"
  eks_cluster_version             = "1.18"
  environment_name                = "dev"
  domain_name                     = "workadventure-game.link"
  ns_servers_list                 = ["ns-1395.awsdns-46.org.", "ns-742.awsdns-28.net.", "ns-53.awsdns-06.com.", "ns-1635.awsdns-12.co.uk."]
  worker_group_1_instance_type    = "t2.small"
  worker_group_2_instance_type    = "t2.medium"
  worker_group_1_desired_capacity = 2
  worker_group_2_desired_capacity = 1

```
_- these variables in example are default, if you don't want to override them - only source filed can be specified;_<br>
_- dont forget to use latest varion of module in ref=0.0.1 notation_

Make init
```shell
terraform init
```

Apply changes
```shell
terraform apply
```

## Contributing

Thanks for considering contributing! There’s information about how to [get started with Workadventure module](CONTRIBUTE.md)

## License

[The MIT License (MIT)](LICENSE.md)

Copyright © 2021 [Denis Lavrushko](https://dlavrushko.de)