#!/usr/bin/env bash

# Is Packer Installed?
which packer &> /dev/null
if [ $? -eq 0 ]; then
	packer_installed="y"
	echo "Great! Packer is installed." | green
else
	packer_installed="n"
	echo "Oh No! Packer is not installed." | red

	if [ "$brew_installed" = "y" ]; then
		echo "Thankfully we can fix this via Homebrew." | green
	fi

	echo "Note: Airlock cannot run without Packer!" | purple

	if [ "$brew_installed" = "y" ]; then
		# Commands that will be run.
		echo "Packer Info: http://www.packer.io" | yellow
		echo "Commands that will be run:" | yellow
		echo "- " | blue -n
		echo "\`brew tap homebrew/binary\`" | yellow
		echo "- " | blue -n
		echo "\`brew install packer\`" | yellow

		# Install Packer?
		echo "Would you like me to install? [y/N]: " | yellow -n
		read install_packer <&0
		: ${install_packer:="n"}
		install_packer="$(echo ${install_packer[0]} | lower)"

		if [ "$install_packer" = "y" ]; then
			brew tap homebrew/binary
			brew install packer
			packer_installed="y"
		fi
	fi

	if [ "$packer_installed" = "n" ]; then
		echo "Please install Packer before running Airlock again." | red
		echo "You can download Packer manually from http://www.packer.io." | red
		exit 1
	fi
fi
