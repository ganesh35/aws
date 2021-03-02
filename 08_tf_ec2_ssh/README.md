# Terraform Modules
Create infrastructure using modules and environment options.  Modules separate common code in to a separe folder and allows us to use it depending on our environments such as dev, prod ...

- [Terraform Modules](#terraform-modules)
  - [Folder structure](#folder-structure)
- [https://git-scm.com/book/it/v2/Git-on-the-Server-Generating-Your-SSH-Public-Key](#httpsgit-scmcombookitv2git-on-the-server-generating-your-ssh-public-key)
  - [Deployment](#deployment)
  - [Destroy](#destroy)
  

##  Folder structure
```bash
├── 05_tf_modules
|   ├── modules/
|   |   ├── ec2/
|   |   |   ├── inistances.tf
|   |   |   └── vars.tf
|   |   ├── vpc/
|   |   |   ├── networking.tf
|   |   |   └── vars.tf
|   |   ├── dev/
|   |   |   ├── main.tf
|   |   |   └── vars.tfvars
|   |   └── prod/
|   |       ├── main.tf
|   |       └── vars.tfvars
|   └── README.md
```

# https://git-scm.com/book/it/v2/Git-on-the-Server-Generating-Your-SSH-Public-Key
## Deployment
Once you have the repository. Initialize the terraform to get required modules and then run terraform plan to see what all resources terraform will create.

```sh
cd 05_tf_modules/dev
terraform init
terraform plan      
terraform apply
```

## Destroy 
Do not forget to desctroy deployed stacks when not using.
```sh
terraform destroy
```

