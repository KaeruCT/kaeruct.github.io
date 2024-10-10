---
title: "fzf + SSH Config Hosts"
date: 2024-10-10T20:42:48+02:00
draft: false
tags:
  - linux
  - ssh
  - tips
---

SSH has a nice feature in which you can store aliases for frequently accessed hosts.

Combining this with [`fzf`](https://github.com/junegunn/fzf), you can have a nice quick shortcut to quickly pick a server to connect to into.

This comes in very handy if you need to ssh into different servers and forget their IP or hostname often.

Here's a sample ssh config file (normally located at `~/.ssh/config`):

```sh
# see https://man.openbsd.org/ssh_config.5 for all the available configuration settings
Host runner-staging
    HostName 10.0.0.8
    User alpha

Host runner-production
    HostName 10.0.0.9
    User beta

Host mainframe
    HostName mainframe.computer.world
    User hackerman
```

Here's a small shell function which calls fzf with the hostnames configured and allows you to pick one to connect to:

```sh
s () {
  local server
  server=$(grep -E '^Host ' ~/.ssh/config | awk '{print $2}' | fzf)
  if [[ -n $server ]] then
    ssh $server
  fi
}
```

Add this function to your `.bashrc` (or `.zshrc`, or whichever config file for your shell) and reload the configuration.

Now, you can quickly ssh into `mainframe` by typing `s`:

```sh
$ s

# fzf will allow to quickly search and pick your server
> runner-staging
  runner-production
  mainframe
  3/3 ──────────

# press enter and you will be connected!
[hackerman@mainframe.computer.world ~]$ 
```