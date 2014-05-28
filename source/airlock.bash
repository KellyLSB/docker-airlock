#!/usr/bin/env bash

# Mash: > include text
# Mash: <=text

. ./text.bash

# Mash: > system! darwin

. ./mac_only.bash

# Mash: > include airlock/command

. ./airlock/command.bash

# Mash: > include airlock/banner
# Mash: <=airlock/banner

. ./airlock/banner.bash

# Mash: > include airlock/providers
# Mash: <=airlock/providers

. ./airlock/vagrant/providers_list.bash

# Mash: > include airlock/config
# Mash: <=airlock/config

. ./airlock/config.bash

##
## Dependencies
##

# Mash: > include dependencies/homebrew
# Mash: <=dependencies/homebrew

. ./dependencies/homebrew.bash

# Mash: > include dependencies/git
# Mash: <=dependencies/git

. ./dependencies/git.bash

# Mash: > include dependencies/vagrant
# Mash: <=dependencies/vagrant

. ./dependencies/vagrant.bash

# Mash: > include dependencies/packer
# Mash: <=dependencies/packer

. ./dependencies/packer.bash

# Mash: > include dependencies/ruby
# Mash: <=dependencies/ruby

. ./dependencies/ruby.bash

# Mash: > include dependencies/bundler
# Mash: <=dependencies/bundler

. ./dependencies/bundler.bash

# Mash: > include dependencies/nokogiri
# Mash: <=dependencies/nokogiri

. ./dependencies/nokogiri.bash

##
## Provider
##

# Mash: > include dependencies/provider
# Mash: <=dependencies/provider

.  ./airlock/vagrant/provider.bash

##
## Boot2Docker
##

# Mash: > include dependencies/boot2docker
# Mash: <=dependencies/docker

. ./airlock/boot2docker.bash
