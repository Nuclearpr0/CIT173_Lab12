#!/bin/bash

echo -e "\nCreate a new user by filling out the options below\n"
echo -e "NOTE: must be run with sudo or as root. After made executable\n"

# a (interactive menu for options that could be done) i guess idk
read -p "Enter Username: " user

# useradd commnad (bash shell and create home directory "bashrc already in there")
useradd $user -s /bin/bash -m |echo -e "\n"

while :; do
read -sp "Enter $user new Password: " pass
echo  -e "\n"
read -sp "Enter $user Password again: " pass2
	if [ $pass == $pass2 ]
	then
		echo  -e "$pass\n$pass" | sudo passwd $user
		break
	else
		echo "passwords don't match try again"
	fi
done

echo -e "\n"
read -p "Enter custom login name (this will not change their Username): " name
#echo -e "\n"
usermod -c $name $user

echo -e "\n$user has be created"
