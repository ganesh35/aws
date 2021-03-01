# S3 Bucket with Terraform
Creating a S3 bucket with a dynamic name and a re-usable policy.

- [S3 Bucket with Terraform](#s3-bucket-with-terraform)
  - [Elements](#elements)
  - [Folder structure](#folder-structure)
  - [Requirements](#requirements)
  - [Terraform scripts](#terraform-scripts)
  - [Deployment](#deployment)
  - [Destroy](#destroy)
  
## Elements 
    - Terraform 
    - S3 Bucket
    - IAM Role

##  Folder structure
```bash
├── 04_tf_s3
|   └── iam-policy.tf
|   ├── variables.tf
|   ├── env.test.tfvars
|   ├── provider.tf
|   ├── s3-iam-policy.json
└── README.md
```

## Requirements
These elements are required to run terraform scripts.

| Name | Description |
|------|-------------|
| AWS Credentials | Assuming that AWS Access keys have been configured using 'aws configure' command |
| terraform | Terraform executable files has be to configured to run scripts |

Credential information can be updated using [provider.tf][provider] file.

## Terraform scripts

| Name | Description | 
|------|-------------|
| [variables.tf][variables] | All variable declarations and their default values |
| [provider.tf][provider] | Cloud provider and availability zone definitions |
| [iam-policy.tf][iam-policy] |  Define bucket name |
| [s3-iam-policy.tf][s3-iam-policy] | Required policy to create a dynamic bucket  |
| [env.test.tfvars][testing] | Test Environment definitions |

## Deployment
Once you have the repository. Initialize the terraform to get required modules and then run terraform plan to see what all resources terraform will create.

```sh
cd 04_tf_s3/infra
terraform init
terraform plan      
terraform apply -var-file="env.test.tfvars"
```


## Destroy 
Do not forget to desctroy deployed stacks when not using.
```sh
terraform destroy
```

[variables]: ./infra/variables.tf
[provider]: ./infra/provider.tf
[iam-policy]: ./infra/iam-policy.tf
[s3-iam-policy]: ./infra/s3-iam-policy.tf
[outputs]: ./infra/outputs.tf
[testing]: ./infra/env.test.tfvars

