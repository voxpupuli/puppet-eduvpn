# @summary Install eduVPN client
#
# @param dist_dir OS particular directory of package repository URL. Defaults in hiera.
# @param manage_repos Should the repositories be managed.
# @param repo_prefix of the repository URL
# @param repo_version eduVPN version string in the repository URL
#
# @example Install eduVPN client
#   class{ 'eduvpn': }
#
class eduvpn (
  Optional[String[1]] $dist_dir = undef,
  Boolean $manage_repos = true,
  Stdlib::Httpsurl $repo_prefix = 'https://app.eduvpn.org/linux/',
  Enum['v4','v4-dev'] $repo_version = 'v4',
) {
  if $facts['os']['family'] == 'RedHat' and $dist_dir =~ Undef {
    fail('The dist_dir directory must be set for os.family == RedHat')
  }

  contain eduvpn::repos
  contain eduvpn::install

  Class['Eduvpn::Repos'] -> Class['Eduvpn::Install']
}
