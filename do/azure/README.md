# Azure
Damit eine VM mit Terraform auf der Azure Cloud Plattform installiert werden kann, muss das Azure CLI installiert werden.

## Installation von Azure CLI unter Ubuntu
Installation muss als root durchgeführt werden:
```bash
sudo -i
```
Installation des Pakets:
```bash
apt-get update
```
```bash
apt-get install ca-certificates curl apt-transport-https lsb-release gnupg
```
```bash
curl -sL https://packages.microsoft.com/keys/microsoft.asc | 
    gpg --dearmor | 
    sudo tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null
```
```bash
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | 
    sudo tee /etc/apt/sources.list.d/azure-cli.list
```
```bash
apt-get update
```
```bash
apt-get install azure-cli
```

## Quelle
https://docs.microsoft.com/bs-cyrl-ba/cli/azure/install-azure-cli-apt?view=azure-cli-latest

## Mit Azure CLI einloggen
```bash
az login <userName>
```