# Dynamic cidr blocks for VPC Subnets

- [Dynamic cidr blocks for VPC Subnets](#dynamic-cidr-blocks-for-vpc-subnets)
  - [Folder structure](#folder-structure)
  - [Deployment](#deployment)
  - [Destroy](#destroy)

##  Folder structure
```bash
├── 06_tf_cidr
|   ├── modules/
|   |   ├── vpc/
|   |   |   ├── networking.tf
|   |   |   └── vars.tf
|   |   ├── dev/
|   |   |   ├── main.tf
|   |   |   └── vars.tfvars
|   └── README.md
```

## Deployment
Once you have the repository. Initialize the terraform to get required modules and then run terraform plan to see what all resources terraform will create.

```sh
cd dev
terraform init
terraform plan      
terraform apply
```

## Destroy 
Do not forget to desctroy deployed stacks when not using.
```sh
terraform destroy
```

