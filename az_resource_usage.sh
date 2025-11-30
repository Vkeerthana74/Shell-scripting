#!/bin/bash

#######Metadata########
#This shellscript will display azure resource usage(nsg,vnet,vms,Entra users)
#author: keerthana
#version: v0.0.1
#######################

#!/bin/bash
set -x
set -e
set -o pipefail

echo "Checking if Azure CLI is installed in linux machine..."

# Check only Linux installation, ignore Windows az under /mnt/c
if ! command -v az >/dev/null 2>&1; then
    echo "Azure CLI NOT installed in linux. Installing Azure CLI..."

    # Update packages
    sudo apt update -y

    # Install dependencies
    sudo apt install ca-certificates curl apt-transport-https lsb-release gnupg -y

    # Create keyrings directory if missing
    sudo mkdir -p /etc/apt/keyrings

    # Download Microsoft signing key
    curl -sL https://packages.microsoft.com/keys/microsoft.asc |
        gpg --dearmor |
        sudo tee /etc/apt/keyrings/microsoft.gpg > /dev/null

    # Add Azure CLI repo
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/microsoft.gpg] \
https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" |
        sudo tee /etc/apt/sources.list.d/azure-cli.list > /dev/null

    # Install Azure CLI
    sudo apt update -y
    sudo apt install azure-cli -y

    echo "Azure CLI installed successfully in Linux!"
else
    echo "  Azure CLI already installed in linux at /usr/bin/az"
fi

echo " Configuring Azure CLI..."

# Log in to Azure
echo "Opening browser for Azure login..."
az login --use-device-code

# Set default output format (optional)
az config set core.output=table

echo "Azure CLI setup completed successfully!"
# list resource groups
echo "list of Resource group"
az group list

# list nsg
echo "list of nsg"
az network nsg list

#list vnet
echo "list of vnets"
az network vnet list

#list vms
echo "list of vms"
az vm list

#list Entra users
echo "list of Entra Users"
az ad user list --output table
                                           
# to add a cron job 
# chmod +x /home/keerthana/azure_resource_usage.sh
#crontab -e -> Choose nano editor if asked.
# run every 5 min - */5 * * * * /home/keerthana/azure_usage.sh >> /home/keerthana/azure_usage.log 2>&1
# grep CRON /var/log/syslog | tail -n 20 -> shows cron jobs

