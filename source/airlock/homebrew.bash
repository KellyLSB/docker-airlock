# Check for Hombrew
which brew &> /dev/null
if [ $? -eq 0 ]; then
  brew_installed="y"
  echo "Great! Homebrew is available." | green
  echo "We will install any missing dependencies." | green
else
  brew_installed="n"
  echo "Homebew is not available." | yellow
  echo "I would recomend downloading the Homebrew at http://brew.sh." | yellow
  echo "Dependencies will not be installed if they are missing." | yellow
fi
