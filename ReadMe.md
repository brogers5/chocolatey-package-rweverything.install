# <img src="https://cdn.jsdelivr.net/gh/brogers5/chocolatey-package-rweverything.install@0a3847839fad160f2403e1aa683f040120b6b9c2/rweverything.install.png" width="48" height="48"/> Chocolatey Package: [RWEverything (Install)](https://community.chocolatey.org/packages/rweverything.install/)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/rweverything.install.svg)](https://community.chocolatey.org/packages/rweverything.install/)
[![Chocolatey package download count](https://img.shields.io/chocolatey/dt/rweverything.install.svg)](https://community.chocolatey.org/packages/rweverything.install/)

---

This package is part of a family of packages published for RWEverything. This repository is for the installer package.
* For the virtual package, see [chocolatey-package-rweverything](https://github.com/brogers5/chocolatey-package-rweverything).
* For the portable package, see [chocolatey-package-rweverything.portable](https://github.com/brogers5/chocolatey-package-rweverything.portable).

See the [Chocolatey FAQs](https://docs.chocolatey.org/en-us/faqs) for more information on [virtual packages](https://docs.chocolatey.org/en-us/faqs#what-is-the-difference-between-packages-no-suffix-as-compared-to.install.portable) and [installer/portable packages](https://docs.chocolatey.org/en-us/faqs#what-distinction-does-chocolatey-make-between-an-installable-and-a-portable-application).

---

## Install
[Install Chocolatey](https://chocolatey.org/install), and run the following command to install the latest approved version on the Chocolatey Community Repository:
```shell
choco install rweverything.install
```

Alternatively, the packages as published on the Chocolatey Community Repository will also be mirrored on this repository's [Releases page](https://github.com/brogers5/chocolatey-package-rweverything.install/releases). The `nupkg` can be installed from the current directory as follows:

```shell
choco install rweverything.install -s .
```

## Build
[Install Chocolatey](https://chocolatey.org/install), clone this repository, and run the following command in the cloned repository:
```shell
choco pack
```

A successful build will create `rweverything.install.x.y.nupkg`, where `x.y` should be the Nuspec's `version` value at build time.

Note that Chocolatey package builds are non-deterministic. Consequently, an independently built package will fail a checksum validation against officially published packages.

## Update
This package should be automatically updated by the [Chocolatey Automatic Package Updater Module](https://github.com/majkinetor/au). If it is outdated by more than a few days, please [open an issue](https://github.com/brogers5/chocolatey-package-rweverything.install/issues).

AU expects the parent directory that contains this repository to share a name with the Nuspec (`rweverything.install`). Your local repository should therefore be cloned accordingly:
```shell
git clone git@github.com:brogers5/chocolatey-package-rweverything.install.git rweverything.install
```

Alternatively, a junction point can be created that points to the local repository (preferably within a repository adopting the [AU packages template](https://github.com/majkinetor/au-packages-template)):
```shell
mklink /J rweverything.install ..\chocolatey-package-rweverything.install
```

Once created, simply run `update.ps1` from within the created directory/junction point. Assuming all goes well, all relevant files should change to reflect the latest version available. This will also build a new package version using the modified files.

Before submitting a pull request, please [test the package](https://docs.chocolatey.org/en-us/community-repository/moderation/package-verifier#steps-for-each-package) using the [Chocolatey Testing Environment](https://github.com/chocolatey-community/chocolatey-test-environment) first.