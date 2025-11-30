#!/bin/bash

#######Metadata########
#This shellscript will display azure resource usage(vm,blob storage,finctions,Entra users)
#author: keerthana
#version: v0.0.1
#######################

set -x
set -e
set -o
# list blobs
echo "list of Blobs"
az storage blob list

#list vms
echo "list of vms"
az vm list

#list functions
echo "list of Functions"
az functionapp function list

#list Entra users
echo "list of Entra Users"
az ad user list
