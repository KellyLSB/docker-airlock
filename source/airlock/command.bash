#!/usr/bin/env bash

if [ "$1" = "-" ]; then
	IFS= read -r -d '' shell_function <<-EOF
	function airlock() {
	  if [ "\$DOCKER_HOST" != "" ]; then
	    echo \$DOCKER_HOST \\
	      | sed -e 's/tcp:\/\///gi' -e 's/:/ /gi' \\
	      | read dh dp <&0

	    timeout 1 bash -c "cat < /dev/null > /dev/tcp/\$dh/\$dp"
	    if [ $? -ne 0 ]; then export DOCKER_HOST=""; fi
	  fi

	  if [ "\$DOCKER_HOST" = "" ]; then
	    command airlock 5>&1 1>&2 2>(tee) | read DOCKER_HOST <&0
	    export DOCKER_HOST
	  fi

	  [ "\$DOCKER_HOST" != "" ] && command docker \$*
	}
	EOF

	echo -e "$shell_function" | head -n -1

	if [ "$2" = "docker" ]; then
		echo "alias \"docker\"=\"airlock\""
	fi

	exit 0
fi
