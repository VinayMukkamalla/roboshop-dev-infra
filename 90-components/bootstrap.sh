#!/bin/bash

component=$1
env=$2


dnf install ansible -y

if [ "$component" == "payment" ]; then
  echo "[INFO] Fixing Python deps for payment"
  sudo dnf remove -y python3-cryptography python3-paramiko || true
  sudo dnf install -y python3-cryptography python3-paramiko python3 python3-devel

  sudo find /usr/lib/python3.9/site-packages -name "__pycache__" -exec rm -rf {} +
  sudo rm -rf ~/.cache/pip
fi

# ansible-pull -U https://github.com/VinayMukkamalla/ansible-roboshop-roles-tf.git -e component=$1 main.yaml 
# as ansible-pull is not respecting our inventory.ini we are using alternative way through shell scripting

REPO_URL=https://github.com/VinayMukkamalla/ansible-roboshop-roles-tf.git
REPO_DIR=/opt/roboshop/ansible
ANSIBLE_DIR=ansible-roboshop-roles-tf

mkdir -p $REPO_DIR
mkdir -p /var/log/roboshop/
touch /var/log/roboshop/ansible.log

cd $REPO_DIR

if [ -d $ANSIBLE_DIR ]; then
    cd $ANSIBLE_DIR
    git pull
else
    git clone $REPO_URL
    cd $ANSIBLE_DIR
fi

ansible-playbook -e component=$component -e env=$env main.yaml