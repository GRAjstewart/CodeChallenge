
# Code Challenge

## Initialize Terraform

Run terraform init to initialize the Terraform deployment. 
```
terraform init
```

## Create a Terraform execution plan
Run terraform plan to create an execution plan.
```
terraform plan -out main.tfplan
```

Key points:

* The terraform plan command creates an execution plan, but doesn't execute it. 
* The optional -out parameter allows you to specify an output file for the plan. Using the -out parameter ensures that the plan you reviewed is exactly what is applied.

## Run terraform apply to apply the execution plan 
```
terraform apply main.tfplan
```
Key points:

* The terraform apply command above assumes you previously ran terraform plan -out main.tfplan.

## To use SSH to connect to the virtual machine, do the following steps:

### Run terraform output to get the SSH private key and save it to a file.
```
terraform output -raw tls_private_key > id_rsa
```
Run terraform output to get the virtual machine public IP address.
```
terraform output public_ip_address
```
### Use SSH to connect to the virtual machine.
```
ssh -i id_rsa azureuser@<public_ip_address>
```

