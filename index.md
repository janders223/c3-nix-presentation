---
title: Introduction to the nix package manager
author: Jim Anders
patat:
  margins:
    top: 50
    left: 20
    right: 20

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

---

# nix is…

an operating system

---

# nix is…

a build tool

--- 

# nix is…

a programming language

---

# nix is…

a CI/CD tool

---

# nix is…

a cloud deployment tool

---

# nix is…

and so much more

---

# nix as a package manager

- `nixpkgs` currently consists of over 60,000 packages
- `nix` _never_ uses host dependencies instead building with precise packages every time
- binaries are cached between builds
- stores packages in isolation from each other using hashes of of the package contents

---
# nix as a package manager


