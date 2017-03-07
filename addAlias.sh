#!/bin/bash
if [ "$#" -ne 2 ]; then
    echo "Invalid number of parameters"
else
    echo "Adding Alias - $1='$2'"
    cd ~
    echo "alias $1='$2'" >> .bashrc
    . .bashrc
fi
