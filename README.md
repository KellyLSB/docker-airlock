# Airlock or Docker.IO and Boot2Docker

So it dawned on me that Boot2Docker is amazing, but I had one complaint. Setting it up with anything other than Vagrant and Virtual Box is a pain, finding all the dependencies is annoying, then starting it when I wanted it was tedious; especially if you want to use an alternate Vagrant provider like Parallels.

That's where Airlock comes in.

Airlock is a tool that will install all the dependencies for you if Homebrew is available; including compiling and initializing boot2docker for alternate providers. If Homebrew is not available it will point you in the right direction to install the dependencies yourself.

When you run `airlock` or optionally aliased to `docker` then Airlock will install dependencies and start your Boot2Docker Virtual Machine or remote host automatically, using Vagrnt. Airlock will then run the command initially requested. If the machine is already running and as long as $DOCKER_HOST is pointed at a running Docker host with the administration ports available, then Airlock will ignore Vagrant altogether and pass the command straight to the Docker client.

Because Airlock wraps around Vagrant and Docker this allow you to use whatever Vagrant provider you like; including providers like AWS or even Open Stack (while this is untested, my theory is that if vagrant is handling the provider is should be possible)
.

Note: This has only been tested with Parallels at this time.

## Built for paranoid engineers

If Airlock needs to install dependencies Airlock will print out a list of all the commands that will be run during the dependency installation process. Don't believe me? Check out the source code; it's open and MIT.

Example Output:

```
Docker Info: http://docker.io
Commands that will be run:
- `brew install docker`
Would you like me to install? [y/N]:
```

## Dependencies

- *Mac OS X*
- *Command Line Tools*
- Homebrew (recomended)
- Git (recomended; untested without)
- Vagrant (Airlock can install with homebrew)
- Packer (Airlock can install with homebrew)
- Docker (Airlock can install with homebrew)
- Ruby 2 (Airlock can install with homebrew and rbenv)
- Nokogiri (Airlock can install with ruby and ruby-gems)
- Vagrant Provider Plugin (Airlock can install with ruby, ruby-gems and bundler)

## How to Install

It's really simple!

### If you trust me.

1. `curl -L https://raw.githubusercontent.com/KellyLSB/docker-airlock/master/airlock > /usr/local/bin/airlock && chmod +x /usr/local/bin/airlock`
4. Add `eval "$(airlock -)"` to your .bash_profile, .zshrc, etc..

### If you are a paranoid engineer.

2. Review contents of file
1. `curl -L https://raw.githubusercontent.com/KellyLSB/docker-airlock/master/airlock > /usr/local/bin/airlock`
2. Re-Review contents of file
3. `chmod +x /usr/local/bin/airlock`
4. Add `eval "$(airlock -)"` to your .bash_profile, .zshrc, etc...

## Future of Airlock

- Support for more operating systems:
  The goal is that eventually Airlock will support installing the dependencies for Linux based operating systems. This will mostly be used done through package managers like RPM and DEB.
  Airlock will then be able to start up remote VMs using providers like AWS, Azure, etc...
- Better Mac OS X Support
- Full MashBash Integration
- Server registry for external Docker Server that you can connect to by name.
- .airlock files that configure Airlock to connect to your projects Docker host.
- Let me know what you want to see.
- Homebrew Formula

## Contributing

Please fork and do whatever.
If you have an amazing addition please send me a PR.

Please keep in mind that I will be using MashBash soon for the source code, which will be compiled down into Bash.

Please checkout http://github.com/KellyLSB/mashbash for more information on MashBash.

## License

Copyright 2014 Kelly Lauren-Summer Becker-Neuding

This code is offered without Warranty or Guarantee under the MIT License.
