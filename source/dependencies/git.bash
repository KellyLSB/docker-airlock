#!/usr/bin/env bash

# Is Git Installed?
which git &> /dev/null
if [ $? -eq 0 ]; then
  git_installed="y"
  echo "Great! Git is installed." | green
else
  git_installed="n"
  echo "Oh No! Git is not installed." | red
  echo "Thankfully we can get around that." | green

  echo "Note: I do recomend that you install Git though." | purple
  echo "      You can install Git with " | purple -n
  echo "\`brew install git\`." | yellow
fi
