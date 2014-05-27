# Is Ruby Installed (it should be)?
which ruby &> /dev/null
if [ $? -eq 0 ]; then
  ruby_installed="y"
  echo "Great! Ruby is installed." | green
else
  ruby_installed="n"
fi

# Is Ruby 2 Installed?
if [ "$ruby_installed" = "y" ]; then
  ruby_version="$(ruby -v \
    | awk '{print $2}' \
    | sed -e 's/\s//gi')"
  if [ "${ruby_version:0:1}" = "2" ]; then
    ruby_installed="y"
    echo "Great! Ruby $ruby_version is installed." | green
  else
    ruby_installed="n"
  fi
fi

# If required install Ruby 2
if [ "$ruby_installed" = "n" ]; then
  echo "Oh No! Ruby 2 is not installed." | red

  if [ "$brew_installed" = "y" ]; then
    echo "Thankfully we can fix this via Homebrew." | green
  fi

  echo "Note: Airdock cannot run without Ruby!" | purple

  if [ "$brew_installed" = "y" ]; then

    # Command that will be run.
    echo "Ruby Info: http://ruby-lang.org" | yellow
    echo "Rbenv Info: https://github.com/sstephenson/rbenv" | yellow
    echo "Ruby Build Info: https://github.com/sstephenson/ruby-build" | yellow
    echo "Commands that will be run:" | yellow
    echo "- " | blue -n
    echo "\`brew install rbenv ruby-build\`" | yellow
    echo "- " | blue -n
    echo "\`rbenv install <latest version>\`" | yellow
    echo "- " | blue -n
    echo "\`rbenv global <latest version>\`" | yellow
    echo "- " | blue -n
    echo "\`rbenv rehash\`" | yellow

    # Install Ruby?
    echo -n "Would you like me to install? [y/N]: " | yellow -n
    read install_ruby <&0
    ${install_ruby:="n"}
    install_ruby="$(echo ${install_ruby[0]} | lower)"

    if [ "$install_ruby" = "y" ]; then
      brew install rbenv ruby-build
      ruby_version="$(rbenv install -l | grep '^\s*2\.[0-9]\.[0-9]' | grep -v '\-\(rc\|preview\|dev\)[0-9]*' | sed -e 's/\s//gi' | sort -r | head -n 1)"
      rbenv install $ruby_version
      rbenv global $ruby_version
      rbenv rehash
      ruby_installed="y"
    fi
  fi
fi

if [ "$ruby_installed" = "n" ]; then
  echo "Please install Ruby before running Airlock again." | red
  exit 1
fi
