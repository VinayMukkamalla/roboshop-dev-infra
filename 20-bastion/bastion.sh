#!/bin/bash

#growing the /home volume for terraform purpose
sudo growpart /dev/nvme0n1 4
sudo lvextend -L +30G /dev/mapper/RootVG-homeVol
sudo xfs_growfs /home

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform



cd /home/ec2-user
git clone https://github.com/VinayMukkamalla/roboshop-dev-infra.git
chown -R ec2-user:ec2-user /home/ec2-user/roboshop-dev-infra/
cd roboshop-dev-infra/40-databases
terraform init 
terraform apply -auto-approve


##########
# sudo growpart /dev/nvme0n1 4 -> increase the partition
# sudo lsblk -> check once again
# sudo lvextend -L +30G /dev/mapper/RootVG-homeVol
# sudo xfs_growfs /home
##########