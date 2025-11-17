#!/bin/bash

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform







##########
# sudo growpart /dev/nvme0n1 4 -> increase the partition
# sudo lsblk -> check once again
# sudo lvextend -L +30G /dev/mapper/RootVG-homeVol
# sudo xfs_growfs /home
##########