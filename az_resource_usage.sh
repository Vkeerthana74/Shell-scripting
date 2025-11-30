#!/bin/bash

#######Metadata########
#This shellscript will display azure resource usage(vm,blob storage,finctions,Entra users)
#author: keerthana
#version: v0.0.1
#######################

# list blobs
az storage blob list

#list vms
az vm list

#list functions
az functionapp function list

#list Entra users
az ad user list
