#!/usr/bin/env bash

# If required install nokogiri
which nokogiri &> /dev/null
if [ $? -eq 0 ]; then
	nokogiri_installed="y"
	echo "Great! Nokogiri is installed." | green
else
	nokogiri_installed="n"
	echo "Oh No! Nokogiri is not installed." | red

	if [ "$ruby_installed" = "y" ]; then
		echo "Thankfully we can fix this via Ruby Gems." | green
	fi

	echo "Note: Airlock cannot run without Nokogiri!" | purple

	if [ "$ruby_installed" = "y" ]; then
		# Command that will be run.
		echo "Ruby Info: http://ruby-lang.org" | yellow
		echo "Rbenv Info: https://github.com/sstephenson/rbenv" | yellow
		echo "Gem Info: http://rubygems.org" | yellow
		echo "Commands that will be run:" | yellow
		echo "- " | blue -n
		echo "\`gem install --user-install nokogiri\`" | yellow

		which rbenv &> /dev/null
		if [ $? -eq 0 ]; then
			echo "- " | blue -n
			echo "\`rbenv rehash\`" | yellow
		fi

		# Install Bundler?
		echo "Would you like me to install? [y/N]: " | yellow -n
		read install_nokogiri <&0
		: ${install_nokogiri:="n"}
		install_nokogiri="$(echo ${install_nokogiri[0]} | lower)"

		if [ "$install_nokogiri" = "y" ]; then
			gem install --no-ri --no-rdoc nokogiri -- --use-system-libraries
			rbenv rehash
			nokogiri_installed="y"
		fi
	fi

	if [ "$nokogiri_installed" = "n" ]; then
		echo "Please install Nokogiri before running Airlock again." | red
		exit 1
	fi
fi
