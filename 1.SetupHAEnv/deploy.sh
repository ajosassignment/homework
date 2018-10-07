#!/bin/sh

#Run ansible-playbook to deploy your cluster
echo 'ansible-playbook -f 20 -i /etc/ansible/hosts /usr/share/ansible/openshift-ansible/playbooks/deploy_cluster.yml'
ansible-playbook  -i /etc/ansible/hosts -f 20 /usr/share/ansible/openshift-ansible/playbooks/deploy_cluster.yml

