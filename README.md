# CD12352 - Infrastructure as Code Project Solution
# Hazal Hamad Alenazi

# The LoadBalancer URL: http://hazal--webap-2s3p7qqjblyy-1104212628.us-east-1.elb.amazonaws.com/


# Parameters
#   $1: Teams. Valid values: Networks, oprations
#   $2: Execution mode. Valid values: deploy, delete, preview.
#   $3: Stack name.
#   $4: Resourse file.
#   $5: Parameters file.
# Usage examples:
#   ./pipline.sh $1{Team who use} $2{Action} $3{stack name} $4{resourse file} $5{parameters file}

# I'm sorry to not mention the run scripts in README file, to run the script there is a file named pipline.sh all the automation scrips are there, I documented the steps one by one and I will do it here.

## Spin up instructions
# Note: I have create two teams and every team have his own scripts first start with network teams

# Network Teams
./pipline.sh network create hazal-final network.yml network-parameters.json
# Opration Teams
./pipline.sh opration create hazal-final-1 udagram.yml udagram-parameters.json


## Tear down instructions

# Opration Teams
./pipline.sh opration delete hazal-final-1
# Network Teams
./pipline.sh network delete hazal-final 

## Other considerations

# In this scripts to create Change sets and preview the work usning --no-execute-changeset.

# Opration Teams
./pipline.sh opration prview hazal-final-1 udagram.yml
# Network Teams
./pipline.sh network preview hazal-final network.yml network-parameters.json
