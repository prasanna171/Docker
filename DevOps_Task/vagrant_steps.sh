#! /bin/bash

# Determine the os and download the corresponding vagrant executable if vagrant doesn't exist.
which vagrant
res=$?
if [ $res -ne 0 ];then
    os=$(uname)
    if [ "$os" == "Darwin" ]; then
        curl -o vagrant  https://releases.hashicorp.com/vagrant/2.2.7/vagrant_2.2.7_x86_64.dmg;
    elif [ "$os" == "Linux" ]; then
        curl -o vagrant.zip https://releases.hashicorp.com/vagrant/2.2.7/vagrant_2.2.7_linux_amd64.zip;
        unzip vagrant.zip 
    else
        echo "Unsupported OS"
        exit 1;
    fi
    mv vagrant /usr/local/bin
fi
echo "Vagrant exists in the current path."
echo "$(which vagrant)"

if [ -f "Vagrantfile" ]; then
    echo "Vagrantfile exists already in the directory, removing it."
    rm -f Vagrantfile
fi

vagrant init ubuntu/bionic64 --template vagrant_file.erb # Initialize the vagrant environment
res=$?
if [ $res -eq 0 ]; then
    echo "Vagrant VM is initialized"
else
    echo "Failed to boot the VM"
    exit 1;
fi
vagrant up --provision  # Boot the VM
res=$?
if [ $res -eq 0 ]; then
    echo "Vagrant VM is initialized, use vagrant ssh to login"
else
    echo "Failed to boot the VM"
    exit 1;
fi