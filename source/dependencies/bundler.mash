#!/usr/bin/env bash

# If required install bundler
which bundler &> /dev/null
if [ $? -eq 0 ]; then
  bundler_installed="y"
  echo "Great! Bundler is installed." | green
else
  bundler_installed="n"
  echo "Oh No! Bundler is not installed." | red

  if [ "$ruby_installed" = "y" ]; then
    echo "Thankfully we can fix this via Ruby Gems." | green
  fi

  echo "Note: Airdock cannot run without Bundler!" | purple

  if [ "$ruby_installed" = "y" ]; then
    # Command that will be run.
    echo "Ruby Info: http://ruby-lang.org" | yellow
    echo "Rbenv Info: https://github.com/sstephenson/rbenv" | yellow
    echo "Gem Info: http://rubygems.org" | yellow
    echo "Bundler Info: http://bundler.io" | yellow
    echo "Commands that will be run:" | yellow
    echo "- " | blue -n
    echo "\`gem install --no-ri --no-rdoc bundler\`" | yellow

    which rbenv &> /dev/null
    if [ $? -eq 0 ]; then
      echo "- " | blue -n
      echo "\`rbenv rehash\`" | yellow
    fi

    # Install Bundler?
    echo "Would you like me to install? [y/N]: " | yellow -n
    read install_bundler <&0
    ${install_bundler:="n"}
    install_bundler="$(echo ${install_bundler[0]} | lower)"

    if [ "$install_bundler" = "y" ]; then
      gem install --no-ri --no-rdoc bundler
      rbenv rehash
      bundler_installed="y"
    fi
  fi

  if [ "$bundler_installed" = "n" ]; then
    echo "Please install Bundler before running Airlock again." | red
    exit 1
  fi
fi
