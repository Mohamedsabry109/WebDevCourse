#!/bin/bash

eval $(ssh-agent)
ssh-add /home/vscode/.ssh/id_rsa
echo -e "\nHost github.com\n  IdentityFile ~/.ssh/id_rsa\n" >> /home/vscode/.ssh/config
sudo chmod 600 /home/vscode/.ssh/config