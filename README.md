# eduVPN

[![Build Status](https://github.com/voxpupuli/puppet-eduvpn/workflows/CI/badge.svg)](https://github.com/voxpupuli/puppet-eduvpn/actions?query=workflow%3ACI)
[![Release](https://github.com/voxpupuli/puppet-eduvpn/actions/workflows/release.yml/badge.svg)](https://github.com/voxpupuli/puppet-eduvpn/actions/workflows/release.yml)
[![Puppet Forge](https://img.shields.io/puppetforge/v/puppet/eduvpn.svg)](https://forge.puppetlabs.com/puppet/eduvpn)
[![Puppet Forge - downloads](https://img.shields.io/puppetforge/dt/puppet/eduvpn.svg)](https://forge.puppetlabs.com/puppet/eduvpn)
[![Puppet Forge - endorsement](https://img.shields.io/puppetforge/e/puppet/eduvpn.svg)](https://forge.puppetlabs.com/puppet/eduvpn)
[![Puppet Forge - scores](https://img.shields.io/puppetforge/f/puppet/eduvpn.svg)](https://forge.puppetlabs.com/puppet/eduvpn)
[![puppetmodule.info docs](https://www.puppetmodule.info/images/badge.svg)](https://www.puppetmodule.info/m/puppet-eduvpn)
[![Apache-2 License](https://img.shields.io/github/license/voxpupuli/puppet-eduvpn.svg)](LICENSE)

## Overview

Configures repositories and installs the eduVPN client: https://www.eduvpn.org


## Example

## Simple install of eduvpn client

```puppet
class{ 'eduvpn': }
```

## Simple install of eduvpn client from a mirror of repository

```puppet
class{ 'eduvpn':
  repo_prefix => 'https://mirror.exampple.org/app.eduvpn.org/linux',
}
```


## Reference

The reference of the quadlet module see [REFERENCE.md](REFERENCE.md)
