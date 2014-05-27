#!/usr/bin/env bash

# Is Vagrant Installed?
which vagrant &> /dev/null
if [ $? -eq 0 ]; then
  vagrant_installed="y"
  echo "Great! Vagrant is installed." | green
else
  vagrant_installed="n"
  echo "Oh No! Vagrant is not installed." | red

  if [ "$brew_installed" = "y" ]; then
    echo "Thankfully we can fix this via a Homebrew Cask." | green
  fi

  echo "Note: Airdock cannot run without Vagrant!." | purple

  if [ "$brew_installed" = "y" ]; then

    # Commands that will be run.
    echo "Caskroom Info: http://caskroom.io" | yellow
    echo "Commands that will be run:" | yellow
    echo "- " | blue -n
    echo "\`brew tap caskroom/cask\`" | yellow
    echo "- " | blue -n
    echo "\`brew install brew-cask\`" | yellow
    echo "- " | blue -n
    echo "\`brew cask install vagrant\`" | yellow

    # Install Vagrant?
    echo "Would you like me to install? [y/N]: " | yellow -n
    read install_vagrant <&0
    ${install_vagrant:="n"}
    install_vagrant="$(echo ${install_vagrant[0]} | lower)"

    if [ "$install_vagrant" = "y" ]; then
      brew tap caskroom/cask
      brew install brew-cask
      brew cask install vagrant
      vagrant_installed="y"
    fi
  fi

  if [ "$vagrant_installed" = "n" ]; then
    echo "Please install Vagrant before running Airlock again." | red
    echo "You can download Vagrant from http://vagrantup.com." | red
    exit 1
  fi
fi
