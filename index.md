---
title: Introduction to the nix package manager
author: Jim Anders
patat:
  eval:
    bash:
      command: bash
      replace: true
  margins:
    top: 50

---

# Introduction to the nix package manager

---

# Or…how I learned to stop fearing package upgrades

. . .

…mostly

<!--
Back in the days of using homebrew it would seem to never fail, a new or updated dependency would be introduced to my project and 1 of two things would happen. A) I would run the run the wrong `brew` command and lose an hour while every package on my machine was updated.  Or B) Update the correct package only to realize that my other project needed the old version and then spend the next hour trying to figure out how to revert the version. Either way, I lost an hour fixing the problem and earned many new grey hairs in trying to fix it.
-->

---

# Who is this guy?

<!--
My name is Jim Anders and I am a senior consultant here at Ingage Partners. I have been in the "industry" now for around 10 years and have truly done a little bit of everything over the years. Although recently, during the DevOps craze I think that I have found my passion and true calling.
-->

---

# What is nix?

<!--
not to be confused with the term "*nix" used to refer to Unix/Linux operating systems
-->

---

# nix is…

a package manager

<!--
First and foremost, nix is a package manager
-->

--- 

# nix is…

a programming language

<!--
The nix configuration language is a pure, lazy functional language used to describe packages.
-->

---

# nix is…

an operating system

<!--
There is also the nixos operating system built on top of the nix package manager and configuration language
-->

---

# nix is…

a build tool

<!--
Not only does nix build the software that powers the world, but can also be used as a powerful build tool to build your software, docker images, and virtual machines
-->

---

# nix is…

a CI/CD tool

<!--
Hydra is a powerful continuous integration service built on top of nixos made for nix based software builds
-->

---

# nix is…

a cloud deployment tool

<!--
nixops is a tool for deploying nixos machines in a local network or on the cloud using all of the aforementioned technologies
-->

---

# nix is…

an ecosystem

<!--
You are free to use as much or as little as you choose. I fell in love with the package manager and have since been looking more and more at running nixos as a daily driver and using nix to build docker images.
-->

---

# nix as a package manager

- A purely functional package manager
- `nixpkgs` currently consists of over 80,000 packages
- `nix` _never_ uses host dependencies instead building with precise packages every time
- binaries are cached between builds
- stores packages in isolation from each other using hashes of the package contents

. . .

```shell
/nix/store/b6gvzjyb2pg0kjfwrjmg1vfhh54ad73z-firefox-33.1/

```

<!--
Packages are treated as values in languages like Haskell, built by functions sans side effects and will never change. Packages are then stored in the `nix store` using a cryptographic hash of the package's build dependency graph. nix will never use a host dependency to build or run a package managed by nix…this is the way. There are currently over 80,000 packages maintained by the community in the nixpkgs repository.
-->

---

# nix as a package manager

## The nix store

- commonly resides at `/nix/store`

```bash
tree /nix/store -L 1 | (head -n 10; echo "…"; tail -n 5)
```
_contents elided for brevity_

. . .

And just to get an idea of the size
```bash
exa --long --no-user --no-time --no-permissions /nix/store | head -n 20
```

<!--
What does a nix store look like you might ask, well it looks a lot like this. I won't be going in to what all of these files are and what they do tonight, but you can see some familiar names in there and maybe even some familiar file types. And remember, the hash of each filename is of the _ENTIRE_ dependency graph of that package.
-->

---

# nix as a package manager

## Using packages

List all currently installed packages
```bash
nix-env -q
```

. . .

Installing a package
```bash
nix-env -iA nixpkgs.hello
```

. . .

And see now that it is installed
```bash
nix-env -q
```

. . .

See that it is on the path
```bash
which hello
```

. . .


And executable
```bash
hello
```

. . .


Removing a package
```bash
nix-env -e hello
```

. . .


And see now that it is removed
```bash
nix-env -q
```

---

#nix as a package manager

## nix profile

```bash
exa --long --no-user ~/.nix-profile
```

. . .

```bash
exa --long --no-user ~/.nix-profile/bin
```

<!--
How does nix manage all of this? With the concept of the nix profile, which is just an elaborate system of symlinks into ~/.nix-profile. As you can see it's just symlinks all the way down to files that reside in the nix store.
-->

---

# nix as a package manager

## nix shell

- semi-analogous to a virtual environment in python
- build once development environment for the entire project stack
- based on `default.nix` for nix build projects and `shell.nix` otherwise
- integrations based on `direnv` for effortless usage
- makes it easy to _try_ out a particular package

. . .

```bash
cat shell.nix
```

---

# nix as a package manager

## nix shell

### Another example

```bash
cat $HOME/src/kong/shell.nix
```

---

# nix as a package manager

## nix flakes

- Introduced in 2.4-pre version
- Entirely new cli
- `flake.lock` file to lock dependencies

. . .

```bash
cat flake.nix
```

. . .

```bash
cat flake.lock
```

---

# nix for managing a macbook

## nix-darwin

- Manage globally installed packages
- Manage sytem configuration options
- Manage launchagent
- and much more…

https://github.com/LnL7/nix-darwin

. . .

```bash
cat  $HOME/.nixpkgs/darwin-configuration.nix
```


---

# nix as a package manager

## Get started today

```shell
$ curl -L https://nixos.org/nix/install | sh
```

---

# nix as a package manager

- https://nixos.org/manual/nix/stable/
- https://nixos.org/manual/nixpkgs/stable/
- https://nixos.wiki/wiki/Nix
- https://nixos.org/guides/nix-pills/index.html

---

# Questions?
