#!/bin/bash
current_dr=$(pwd)/bin

#add ope tool to path so user can use in any directory
echo " " >> ${HOME}/.bashrc
echo "export PATH=$current_dr:\$PATH" >> ${HOME}/.bashrc
#rerun bashrc so it's updated to have ope
source ${HOME}/.bashrc

#tell user ope tool has been installed
echo "ope has been added to the path successfully"
