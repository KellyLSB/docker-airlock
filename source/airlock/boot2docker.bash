#!/usr/bin/env bash

# Install/Launch Vagrant Parallels Boot2Docker
mkdir -p "$AIRLOCK_PATH/boot2docker"
cd "$AIRLOCK_PATH/boot2docker"
vagrant init $VAGRANT_PROVIDER_LOWER/boot2docker 2> /dev/null
vagrant up --provider $VAGRANT_PROVIDER_LOWER
if [ $? -eq 0 ]; then
	AIRLOCK_HOST="$(vagrant ssh-config | sed -n 's/[ ]*HostName[ ]*//gp')"
	echo "tcp://$AIRLOCK_HOST:4243" >&5
else
	echo "There was an issue starting up boot2docker on $VAGRANT_PROVIDER_NAME." \
		| red
fi
