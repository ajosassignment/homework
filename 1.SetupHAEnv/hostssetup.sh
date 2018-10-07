#!/bin/sh

my_path=`pwd`

echo "Backup original hosts file"

mv /etc/ansible/hosts /etc/ansible/hosts.original


echo "Copy  hosts file from checkout folder to /etc/ansible/hosts"

cp hosts /etc/ansible/hosts

cd /etc/ansible

#Enable logging in  /etc/ansible/ansible.cfg

# uncomment , following : log_path = /var/log/ansible.log

sed -i "s/#log_path/log_path/g" /etc/ansible/ansible.cfg

export GUID=`hostname | cut -d"." -f2`; echo "export GUID=$GUID" >> $HOME/.bashrc

# Update hosts/inventory file

sed -i "s/GUID/$GUID/g" /etc/ansible/hosts

