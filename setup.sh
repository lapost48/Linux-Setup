#!/bin/bash

package_list=( emacs python-devel python-matplotlib java-1.8.0-openjdk-devel )
pypackage_list=( tensorflow numpy scipy pillow )

if [ $1 == -all ]; then
    # Setup Easy Alias
    cp addAlias.sh ~/.addAlias.sh
    pushd ~
    echo "alias aa='source ~/.addAlias.sh'" >> .bashrc
    . .bashrc

    #Setup Custom Aliases
    aa c clear
    aa la "ls -a"
    aa emacs "emacs -nw"
    source .bashrc
    popd

    # Setup Frequent Packages
    sudo dnf install ${package_list[*]}
    wget -O atom.rpm https://atom.io/download/rpm
    rpm --install atom.rpm
    rm atom.rpm

    # Setup Python Packages
    sudo pip install --upgrade pip
    sudo pip install ${pypackage_list[*]}
else
    while test $# -gt 0
    do
	case "$1" in
            -a) # Setup Easy Alias
		cp addAlias.sh ~/.addAlias.sh
		pushd ~
		echo "alias aa='source .addAlias.sh'" >> .bashrc
		source .

		#Setup Custom Aliases
		aa c clear
		aa la "ls -a"
		aa emacs "emacs -nw"
		popd
		;;
            -d) # Setup Frequent Packages
		sudo dnf install ${package_list[*]}
		;;
            -p) # Setup Python Packages
		sudo pip install --upgrade pip
		sudo pip install ${pypackage_list[*]}
		;;
	    -steam) # Install Steam
		su -c 'dnf -y install xorg-x11-drv-amdgpu mesa-libGL.i686 mesa-dri-drivers.i686'
		su -c 'dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm'
		su -c 'dnf -y update'
		su -c 'dnf -y install steam'
		;;
	esac
	shift
    done
fi
