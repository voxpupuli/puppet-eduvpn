# @summary Install eduVPN client
#
# @param repo_dir OS particular directory of package repository URL. Default in hiera.
# @param manage_repos Should the repositories be managed.
# @param prefix of the repository URL
# @param repo_version eduVPN version string in the repository URL
#
# @example Install eduVPN client
#   class{ 'eduvpn': }
#
class eduvpn (
  String[1] $repo_dir,
  Boolean $manage_repos = true,
  Stdlib::Httpsurl $repo_prefix = 'https://app.eduvpn.org/linux/',
  Enum['v4','v4-dev'] $repo_version = 'v4',
) {
  contain eduvpn::repos
  contain eduvpn::install

  Class['Eduvpn::Repos'] -> Class['Eduvpn::Install']
}
