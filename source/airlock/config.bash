#!/usr/bin/env bash

# Update Configs
: ${CWD:=$(pwd)}
: ${AIRLOCK_PATH:=~/.docker}
: ${VAGRANT_PROVIDER:=parallels}
: ${VAGRANT_PROVIDER_LOWER:=$(echo $VAGRANT_PROVIDER | lower)}
: ${VAGRANT_PROVIDER_UPPER:=$(echo $VAGRANT_PROVIDER | upper)}
: ${VAGRANT_PROVIDER_NAME:=$(echo $VAGRANT_PROVIDER_LOWER | capitalize)}
: ${VAGRANT_PROVIDER_PATH:="$AIRLOCK_PATH/$VAGRANT_PROVIDER_LOWER"}
eval VAGRANT_PROVIDER_REPO="\$VAGRANT_PROVIDER_REPO_$VAGRANT_PROVIDER_UPPER"


# Output Configuration
#if [ "$1" = "config" ]; then
  echo "Airlock Configuration:" | red

  # Airlock Path
  echo "  \$"          | blue -n
  echo "AIRLOCK_PATH"  | purple -n
  echo " ......... "   | yellow -n
  echo "$AIRLOCK_PATH" | cyan

  # Vagrant Provider
  echo "  \$"              | blue -n
  echo "VAGRANT_PROVIDER"  | purple -n
  echo " ......... "       | yellow -n
  echo "$VAGRANT_PROVIDER" | cyan

  # Vagrant Provider Lower
  echo "  \$"                    | blue -n
  echo "VAGRANT_PROVIDER_LOWER"  | purple -n
  echo " ... "                   | yellow -n
  echo "$VAGRANT_PROVIDER_LOWER" | cyan

  # Vagrant Provider Upper
  echo "  \$"                    | blue -n
  echo "VAGRANT_PROVIDER_UPPER"  | purple -n
  echo " ... "                   | yellow -n
  echo "$VAGRANT_PROVIDER_UPPER" | cyan

  # Vagrant Provider Name
  echo "  \$"                    | blue -n
  echo "VAGRANT_PROVIDER_NAME"  | purple -n
  echo " ... "                   | yellow -n
  echo "$VAGRANT_PROVIDER_NAME" | cyan

  # Vagrant Provider Path
  echo "  \$"                   | blue -n
  echo "VAGRANT_PROVIDER_PATH"  | purple -n
  echo " .... "                 | yellow -n
  echo "$VAGRANT_PROVIDER_PATH" | cyan

  # Vagrant Provider Repo
  echo "  \$"                   | blue -n
  echo "VAGRANT_PROVIDER_REPO"  | purple -n
  echo " .... "                 | yellow -n
  echo "$VAGRANT_PROVIDER_REPO" | cyan

  # Current Working Directory
  echo "  \$"                     | blue -n
  echo "CWD"                      | purple -n
  echo " ...................... " | yellow -n
  echo "$CWD"                     | cyan

  # Space
  echo ""
#fi
