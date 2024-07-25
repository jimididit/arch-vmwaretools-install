#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root" >&2
  exit 1
fi

echo "Updating system package database and upgrading packages..."
pacman -Syu --noconfirm

# Install base dependencies
pacman -S base-devel net-tools linux-headers --noconfirm

# Prompt user to install VMWareTools via VMWare Tab...
read -p "Is VMWare Tools installed Before Mounting CDRom By Going To 'VM > Install VMWare Tools'? (y/n) " answer

case $answer in
	[Yy]* )
		echo "VMWareTools is already installed. Proceeding..."
	[Nn]* )
		echo "Please first install VMWare Tools By Going To 'VM > Install VMWare Tools'. Exiting Script."
		exit 0;;
	* )
		echo "Invalid Input. Please answer y or n."
		exit 1;;
esac

# Creat bogus init directories for the installer
for x in {0..6}; do mkdir -p /etc/init.d/rc${x}.d; done

# Mounting CDRom
echo "Mounting CDROM..."
mount /dev/cdrom /mnt

# Extracting .tar file to '/root'
# search_dir="/mnt"

# Find the most recent version of VMwareTools downloaded in the /mnt directory
# recent_file=$(find "$search_dir" -type f -name 'VMware-Tools-*' -printf '%T+ %p\n' | sort -r | head -n 1 | cut -d' ' -f2-)

# Extract VMware-Tools
echo "Extracting VMware-Tools..."
tar xf VMware-Tools*.tar.gz -C /root

# Uninstall the last version of vmware-tools by running the uninstall perl script
echo "Running vmware-uninstall script to remove any previous versions..."
/usr/bin/vmware-uninstall-tools.pl

# Run the vmware-tools install perl script
echo "Running the vmware-tools install perl script..."
perl /root/vmware-tools-distrib/vmware-install.pl

echo "Installation Complete!"
