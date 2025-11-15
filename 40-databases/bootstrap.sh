#!/bin/bash
component=$1

dnf install ansible -y
# ansible-pull -U https://github.com/VinayMukkamalla/ansible-roboshop-roles-tf.git -e component=$1 main.yaml 
# as ansible-pull is not respecting our inventory.ini we are using alternative way through shell scripting

REPO_URL=https://github.com/VinayMukkamalla/ansible-roboshop-roles-tf.git
ANSIBLE_DIR=/opt/roboshop/ansible
REPO_DIR=ansible-roboshop-roles-tf

mkdir -p /var/log/ansible/
touch /var/log/ansible/ansible.log

mkdir -p $ANSIBLE_DIR
cd $ANSIBLE_DIR

if [ -d $REPO_DIR ]; then
    cd $$REPO_DIR
    git pull
else
    git clone $REPO_URL
    cd $REPO_DIR
fi

ansible-playbook -e component=$component main.yaml

