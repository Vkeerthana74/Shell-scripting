#!/bin/bash

#######Metadata########
#This shellscript will display azure resource usage(resource groups,nsg,vnet,vms,Entra users)
#author: keerthana
#version: v0.0.1
#######################

set -x
set -e
set -o pipefail

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
