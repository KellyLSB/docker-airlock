#!/usr/bin/env bash

. ./text.bash
. ./mac_only.bash
. ./airlock/command.bash
. ./airlock/banner.bash
. ./airlock/vagrant/provider_list.bash
. ./airlock/config.bash

##
## Dependencies
##

. ./dependencies/homebrew.bash
. ./dependencies/git.bash
. ./dependencies/vagrant.bash
. ./dependencies/packer.bash
. ./dependencies/docker.bash
. ./dependencies/ruby.bash
. ./dependencies/bundler.bash
. ./dependencies/nokogiri.bash

##
## Provider
##

. ./airlock/vagrant/provider.bash

##
## Boot2Docker
##

. ./airlock/boot2docker.bash

exit 0
