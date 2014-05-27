

# If required install Vagrant Provider
vagrant plugin list | grep $VAGRANT_PROVIDER_LOWER > /dev/null 2>&1
if [ $? -eq 0 ]; then
  vagrant_provider_installed="y"
  echo "Great! The Vagrant Provider for " | green -n
  echo "$VAGRANT_PROVIDER_NAME is installed." | green
else
  vagrant_provider_installed="n"
  echo "Oh No! The Vagrant Provider for " | red -n
  echo "$VAGRANT_PROVIDER_NAME is not installed." | red

  if [ "$git_installed" = "y" ] \
    && [ "$ruby_installed" = "y" ] \
    && [ "$bundler_installed" = "y" ] \
    && [ "$nokogiri_installed" = "y" ]; then
    echo "Thankfully we can fix this via " | green -n
    echo "Git, Ruby Gems, Bundler and Nokogiri." | green
  elif [ "$ruby_installed" = "y" ] \
    && [ "$bundler_installed" = "y" ] \
    && [ "$nokogiri_installed" = "y" ]; then
    echo "Thankfully we can fix this via " | green -n
    echo "Curl, Tar, Ruby Gems, Bundler and Nokogiri." | green
  fi

  echo "Note: Airdock cannot run without a Vagrant Provider!" | purple

  if [ "$git_installed" = "y" ]; then
    git ls-remote $VAGRANT_PROVIDER_REPO &> /dev/null
    if [ $? -ne 0 ]; then
      VAGRANT_PROVIDER_REPO="https://github.com/$VAGRANT_PROVIDER_REPO.git"
    fi
  else
    curl -L $VAGRANT_PROVIDER_REPO &> /dev/null
    if [ $? -ne 0 ]; then
      VAGRANT_PROVIDER_REPO="https://github.com/$VAGRANT_PROVIDER_REPO/archive/master.tar.gz"
    fi
  fi

  if [ "$git_installed" = "y" ] \
    && [ "$ruby_installed" = "y" ] \
    && [ "$bundler_installed" = "y" ] \
    && [ "$nokogiri_installed" = "y" ]; then

    # Command that will be run.
    echo "Git Info: http://git-scm.org" | yellow
    echo "Ruby Info: http://ruby-lang.org" | yellow
    echo "Gem Info: http://rubygems.org" | yellow
    echo "Bundler Info: http://bundler.io" | yellow
    echo "Commands that will be run:" | yellow
    echo "- " | blue -n
    echo "\`git clone $VAGRANT_PROVIDER_REPO $VAGRANT_PROVIDER_PATH\`" | yellow
    echo "- " | blue -n
    echo "\`cd $VAGRANT_PROVIDER_PATH; " | yellow -n
    echo "bundle install; cd $CWD\`" | yellow
    echo "- " | blue -n
    echo "\`cd $VAGRANT_PROVIDER_PATH; " | yellow -n
    echo "rake build;\`" | yellow
    echo "- " | blue -n
    echo "\`cd $VAGRANT_PROVIDER_PATH; " | yellow -n
    echo "vagrant plugin install ./pkg/<latest>.gem\`" | yellow

    # Install Vagrant Plugin?
    echo "Would you like me to install? [y/N]: " | yellow -n
    read install_vagrant_plugin <&0
    : ${install_vagrant_plugin:="n"}
    install_vagrant_plugin="$(echo ${install_vagrant_plugin[0]} | lower)"

    if [ "$install_vagrant_plugin" = "y" ]; then
      git clone $VAGRANT_PROVIDER_REPO $VAGRANT_PROVIDER_PATH
      cd $VAGRANT_PROVIDER_PATH
      bundle install
      rake build
      provider_gem="$(find ./pkg/*.gem -type file | sort -r | head -n 1)"
      vagrant plugin install $provider_gem 2> /dev/null
      vagrant_provider_installed="y"
      cd $CWD
    fi
  elif [ "$ruby_installed" = "y" ] \
    && [ "$bundler_installed" = "y" ] \
    && [ "$nokogiri_installed" = "y" ]; then

    # Command that will be run.
    echo "Ruby Info: http://ruby-lang.org" | yellow
    echo "Gem Info: http://rubygems.org" | yellow
    echo "Bundler Info: http://bundler.io" | yellow
    echo "Commands that will be run:" | yellow
    echo "- " | blue -n
    echo "\`curl -L $VAGRANT_PROVIDER_REPO | tar -xzvf --strip-components 1 -C $VAGRANT_PROVIDER_PATH\`" | yellow
    echo "- " | blue -n
    echo "\`cd $VAGRANT_PROVIDER_PATH; " | yellow -n
    echo "bundle install; cd $CWD\`" | yellow
    echo "- " | blue -n
    echo "\`cd $VAGRANT_PROVIDER_PATH; " | yellow -n
    echo "rake build;\`" | yellow
    echo "- " | blue -n
    echo "\`cd $VAGRANT_PROVIDER_PATH; " | yellow -n
    echo "vagrant plugin install ./pkg/<latest>.gem\`" | yellow

    # Install Vagrant Plugin?
    echo "Would you like me to install? [y/N]: " | yellow -n
    read install_vagrant_plugin <&0
    : ${install_vagrant_plugin:="n"}
    install_vagrant_plugin="$(echo ${install_vagrant_plugin[0]} | lower)"

    if [ "$install_vagrant_plugin" = "y" ]; then
      curl -L $VAGRANT_PROVIDER_REPO | tar -xzvf --strip-components 1 -C $VAGRANT_PROVIDER_PATH
      cd $VAGRANT_PROVIDER_PATH
      bundle install
      rake build
      provider_gem="$(find ./pkg/*.gem -type file | sort -r | head -n 1)"
      vagrant plugin install $provider_gem 2> /dev/null
      vagrant_provider_installed="y"
      cd $CWD
    fi
  fi

  if [ "$vagrant_provider_installed" = "n" ]; then
    echo "Please install The Vagrant Provider before running Airlock again." | red
    exit 1
  fi
fi
