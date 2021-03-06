# Lambda (Python) Function with Terraform
Create and deploy a basic Python Lambda Function using Terraform. 

- [Lambda (Python) Function with Terraform](#lambda-python-function-with-terraform)
  - [Elements](#elements)
  - [Folder structure](#folder-structure)
  - [Requirements](#requirements)
  - [Terraform scripts](#terraform-scripts)
  - [Deployment](#deployment)
  - [Switching / Creating Environments](#switching--creating-environments)
  - [Destroy](#destroy)
  
## Elements 
    - Terraform 
    - Lambda Function (Python)
    - IAM Role

##  Folder structure
```bash
├── 01_tf_lambda_py
|   ├── infra/
|   |   └── iam/
|   |   |   ├── lambda-policy.json
|   |   |   └── lambda-assume-policy.json
|   |   ├── variables.tf
|   |   ├── env.test.tfvars
|   |   ├── provider.tf
|   |   ├── lambda-iam.tf
|   |   ├── lambda.tf
|   ├── src/
|   |   └── welcome.py
|   ├── outputs/
|   └── README.md
```

## Requirements
These elements are required to run terraform scripts.

| Name | Description |
|------|-------------|
| AWS Credentials | Assuming that AWS Access keys have been configured using 'aws configure' command |
| terraform | Terraform executable files has be to configured to run scripts |
| [welcome.py][welcome] | Lambda Python function |

Credential information can be updated using [provider.tf][provider] file.

## Terraform scripts

| Name | Description | 
|------|-------------|
| [variables.tf][variables] | All variable declarations and their default values |
| [provider.tf][provider] | Cloud provider and availability zone definitions |
| [lambda-iam.tf][lambda-iam] |  Definitions of Lambda policy and role |
| [lambda.tf][lambda] | Archive and upload Lambda Function  |
| [outputs.tf][outputs] | Displaying Load balancer dns_name for the application  |
| [env.test.tfvars][testing] | Test Environment definitions |

## Deployment
Once you have the repository. Initialize the terraform to get required modules and then run terraform plan to see what all resources terraform will create.

```sh
cd terraform_01/infra
terraform init
terraform plan      
terraform apply -var-file="env.test.tfvars"
```

## Switching / Creating Environments

Create more environments from the attached file [env.test.tfvars][testing]
```sh
cp env.test.tfvars env.prod.tfvars
nano env.prod.tfvars
```

Add changes to env.prod.tfvars and deploy application.
```sh
terraform apply -var-file="env.prod.tfvars"
```

## Destroy 
Do not forget to desctroy deployed stacks when not using.
```sh
terraform destroy
```

[variables]: ./infra/variables.tf
[provider]: ./infra/provider.tf
[lambda-iam]: ./infra/lambda-iam.tf
[lambda]: ./infra/lambda.tf
[outputs]: ./infra/outputs.tf
[testing]: ./infra/env.test.tfvars
[welcome]: ./src/welcome.py
