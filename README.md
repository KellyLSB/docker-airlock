# Airlock or Docker.IO and Boot2Docker

So it dawned on me that Boot2Docker is amazing, but I had one complaint. Setting it up with anything other than Vagrant is a pain. Finding all the dependencies is annoying, then starting it when I wanted it was also a pain.

That's where Airlock comes in.

Airlock is a tool that if Homebrew is available will install all the dependencies for you (including compiling and initializing boot2docker for alternate providers). If Homebrew is not available it point you in the right direction to install the dependencies yourself.

When you run `airlock` or optionally aliased to `docker` then Airlock will install dependencies and start your Docker virtual machine automatically, then Airlock will run the command requested. If the machine is already running as long as $DOCKER_HOST is pointed at a running Docker host with the administration ports available, then Airlock will ignore the starting of the virtual machine and pass the command straight to the docker client.

Because Airlock wraps around Vagrant and Docker this allow you to use whatever Vagrant provider you prefer.

Note: This has only been tested with Parallels at this time.

### Built for paranoid engineers

If Airlock needs to install dependencies Airlock will printout a list of all the commands that will be run during the dependency instal process. Don't believe me? Check out the source code; it's open and MIT.

Example:

```
- `brew tap <repo>`
- `brew install <package>`
```

### Dependencies

- *Mac OS X*
- *Command Line Tools*
- Homebrew (recomended)

### How to Install

Since Airlock is a work in progress at the moment you need to check out this repository. From there you can run `source/airlock.bash`. You can create a symlink of this file to `/usr/local/bin` if you would like.

In the future Airlock will be distributed as a single file.

### What are these MASH Files

My biggest complaint writing Bash scripts is the massive amount of repetitive code. None of it is Dry and because it is Bash there is not much we can do about it. However since Bash is pretty much available by default on every Machine I decided to prepare Airlock to eventually support BashMash which is a parser and compiler that allows you to create reusable Bash statements and syntaxicly beautiful source files.

Want to learn more about MashBash check out the GitHub repository for MashBash at http://github.com/KellyLSB/mashbash for updates.

### Future of Airlock

- Support for more operating systems:
  The goal is that eventually Airlock will support installing the dependencies for Linux based operating systems. This will mostly be used done through package managers like RPM and DEB.
  Airlock will then be able to start up remote VMs using providers like AWS, Azure, etc...
- Better Mac OS X Support
- Full MashBash Integration
- Server registry for external Docker Server that you can connect to by name.
- .airlock files that configure Airlock to connect to your projects Docker host.
- Let me know what you want to see.

### License

Copyright 2014 Kelly Lauren-Summer Becker-Neuding

This code is offered without Warranty or Guarentee under the MIT License.