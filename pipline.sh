#!/bin/bash
# Automation script for CloudFormation templates. 
#
# Parameters
#   $1: Teams. Valid values: Networks, oprations
#   $2: Execution mode. Valid values: deploy, delete, preview.
#   $3: Stack name.
#   $4: Resourse file.
#   $5: Parameters file.
#
# Usage examples:
#   ./pipline.sh $1{Team who use} $2{Action} $3{stack name} $4{resourse file} $5{parameters file}
#   EX:
#   ./pipline.sh opration create hazal-final-1 udagram.yml udagram-parameters.json
#   ./pipline.sh opration delete hazal-final-1
#   ./pipline.sh opration deploy hazal-final-1 udagram.yml udagram-parameters.json
#   ./pipline.sh opration prview hazal-final-1 udagram.yml

# Validate parameters
if [[ $1 != "network" && $1 != "opration" ]]; then 
    echo "ERROR: please enter a valid name like: network, opration" >&2
    exit 1
fi

# Validate parameters
if [[ $2 != "deploy" && $2 != "delete" && $2 != "preview" && $2 != "create" ]]; then 
    echo "ERROR: please enter a valid name like: deploy, delete, preview, create, or submit" >&2
    exit 1
fi

#--------- START -----------#
# Network section
if [ $1 == "network" ]
then
    if [ $2 == "deploy" ]
    then
        aws cloudformation deploy \
            --stack-name $3 \
            --template-file $4 \
            --parameters-ovverrides $5 \
            --region us-east-1
fi
fi

if [ $1 == "network" ]
then 
    if [ $2 == "create" ]
    then 
        aws cloudformation create-stack \
            --stack-name $3 \
            --template-body file://$4 \
            --parameters file://$5 \
            --region=us-east-1
fi
fi

if [ $1 == "network" ]
then
    if [ $2 == "prview" ]
    then
        aws cloudformation deploy \
            --stack-name $3 \
            --template-file file://$4 \
            --no-execute-changeset \
            --region=us-east-1
fi
fi

if [ $1 == "network" ]
then
    if [ $2 == "delete" ]
    then
        aws cloudformation delete-stack \
            --stack-name $3 \
            --region=us-east-1
    
        echo "Note: Delete in progress"
fi
fi

#------------ END -------------#
#----------- START ----------#
# Opration Section
if [ $1 == "opration" ]
then
    if [ $2 == "delete" ]
    then
        aws cloudformation delete-stack \
            --stack-name $3 \
            --region=us-east-1
    
        echo "Note: Delete in progress"
fi
fi

if [ $1 == "opration" ]
then
    if [ $2 == "prview" ]
    then
        aws cloudformation deploy \
            --stack-name $3 \
            --template-file file://$4 \
            --no-execute-changeset \
            --region=us-east-1
fi
fi

if [ $1 == "opration" ]
then
    if [ $2 == "create" ]
    then
        aws cloudformation create-stack \
            --stack-name $3 \
            --template-body file://$4 \
            --parameters file://$5 \
            --capabilities CAPABILITY_NAMED_IAM \
            --region=us-east-1 
fi
fi

if [ $1 == "opration" ]
then
    if [ $2 == "deploy" ]
    then
        aws cloudformation deploy \
            --stack-name $3 \
            --template-file $4 \
            --region us-east-1
fi
fi
#------------ END -------------#