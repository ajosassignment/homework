#!/bin/sh


curr_path=`pwd`

export GUID=`hostname | cut -d"." -f2`; echo "export GUID=$GUID" >> $HOME/.bashrc

# Create  an HA environment

cd $curr_path/1.SetupHAEnv

ansible-playbook ha-env-setup.yaml

# post deploy environment check and deploy a sample project

cd $curr_path/2.PostSetupCheck

ansible-playbook postdeploy.yaml

# CICD Pipeline TASK

cd $curr_path/3.CICD

ansible-playbook create-pipeline-proj.yaml

#wait for couple of  minute for CICD task to complete
sleep 2m

#create multitenancy

cd $curr_path/4.Multitenancy

ansible-playbook create-multitenancy.yaml

#create multiple clients

cd $curr_path/4.Multitenancy

ansible-playbook create-clients.yaml

#HPA working on production deployment of openshift-tasks in project tasks-prod

cd $curr_path/3.CICD

ansible-playbook create-task-hpa.yaml




