#check that all prerequisites are available
echo 'ansible-playbook -f 20 -i /etc/ansible/hosts /usr/share/ansible/openshift-ansible/playbooks/prerequisites.yml'
ansible-playbook -f 20 -i /etc/ansible/hosts  /usr/share/ansible/openshift-ansible/playbooks/prerequisites.yml
