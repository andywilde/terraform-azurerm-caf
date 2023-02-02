# Instructions

```bash
terraform plan -var-file aks.tfvars  -var-file networking.tfvars -out out.tfplan -no-color | tee plan.log
terraform apply "out.tfplan" -no-color | tee apply.log
terraform destroy -var-file aks.tfvars  -var-file networking.tfvars -no-color | tee destroy.log
```
