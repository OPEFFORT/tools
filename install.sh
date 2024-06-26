#!/bin/bash
current_dr=$(pwd)/bin

#if path was not already added, add path
if ! grep -q -s "export PATH=$current_dr:\$PATH" ~/.bashrc; then
  echo "export PATH=$current_dr:\$PATH" >> ~/.bashrc #add it to path
  source ~/.bashrc #rerun bashrc to reset shell
fi

#tell user ope tool has been installed
echo "ope has been added to the path successfully"