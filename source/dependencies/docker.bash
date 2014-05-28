#!/usr/bin/env bash

# Is Docker Installed?
which docker &> /dev/null
if [ $? -eq 0 ]; then
	docker_installed="y"
	echo "Great! Docker is installed." | green
else
	docker_installed="n"
	echo "Oh No! Docker is not installed." | red

	if [ "$brew_installed" = "y" ]; then
		echo "Thankfully we can fix this via Homebrew." | green
	fi

	echo "Note: Airlock cannot run without Docker!" | purple

	if [ "$brew_installed" = "y" ]; then
		# Commands that will be run.
		echo "Docker Info: http://docker.io" | yellow
		echo "Commands that will be run:" | yellow
		echo "- " | blue -n
		echo "\`brew install docker\`" | yellow

		# Install Docker?
		echo "Would you like me to install? [y/N]: " | yellow -n
		read install_docker <&0
		: ${install_docker:="n"}
		install_docker="$(echo ${install_docker[0]} | lower)"

		if [ "$install_docker" = "y" ]; then
			brew install docker
			docker_installed="y"
		fi
	fi

	if [ "$docker_installed" = "n" ]; then
		echo "Please install Docker before running Airlock again." | red
		echo "You can download Docker manually from http://www.docker.io." | red
		exit 1
	fi
fi
