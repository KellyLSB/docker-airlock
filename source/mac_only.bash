#!/usr/bin/env bash

# Check for Mac OS
if [ "$(uname)" != "Darwin" ]; then
  echo "This only works on Mac OS X" 1>&2
  exit 1
fi
