# DigitalOcean
## wie mit den Examples umgehen

1. SSH IDs von DO herauslesen
```bash
./scripts/get_all_ssh_ids.sh [DO_API_KEY]
```

2. In das Terrafrom Verzeichnis wechseln (dort wo das "main.tf" liegt)

3. Initialisieren von Terraform
```bash
Terrafrom init
```

3. Terraform Plan
```bash
terraform plan -var="do_token=[TOKEN]" -var="ssh_key_id=[ID_1,ID_2,ID_3]"
``` 

4. Terraform apply
```bash
terraform apply -var="do_token=[TOKEN]" -var="ssh_key_id=[ID_1,ID_2,ID_3]"
```

5. Terrafrom destroy
```bash
terraform destroy -var="do_token=[TOKEN]"
```
