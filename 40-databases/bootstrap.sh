component = $1

dnf install ansible -y
ansible-pull -U https://github.com/VinayMukkamalla/ansible-roboshop-roles-tf.git -e component = $1 main.yaml -e "component=mongodb"

#