# Terraform Script to trigger AKS

### Usage:


This script is dedicated to demo and the resources realted to that.
Executing this script will create below resources for demo.

## <u>Resources list:</u>

| **S.No** | **Resource Type** |
|------|------|
|1|Resource Group  `Single ` ***We can use existing RG as well here.***|
|2|AKS Cluster  `Single`|

## <u>Pipelines:</u>

- This script can be triggred from Azure pipelines as well. 
- Create a new pipeline and add the create piepline from the pipelines folder. 
- Add the storage account details in the backend.tf file. 
- Add the subscription details in provider.tf file. 
- Execute - Using service principal or managed Identity. 
- Add the service principal details (Client ID and Secret) in the provider file. (This can be ignored if we are using managed identity.)

## <u>Commands:</u>
- Trigger using tf commands.
- az login - Use this to authenticate with the Azure portal.  
- terraform init
- terraform plan -var-file="./demo/demo.tfvars" -input=false -out=tfplan
- terraform apply -auto-approve -input=false tfplan
