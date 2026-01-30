# @api private
class eduvpn::repos (
  Boolean $manage_repos = $eduvpn::manage_repos,
  String[1] $repo_version = $eduvpn::repo_version,
  Stdlib::Httpsurl $repo_prefix = $eduvpn::repo_prefix,
  String[1] $repo_dir = $eduvpn::repo_dir,
) {
  if $manage_repos {
    case $facts['os']['family'] {
      'RedHat': {
        yumrepo { 'python-eduvpn-client':
          descr    => "eduVPN for Linux ${repo_version}",
          baseurl  => "${repo_prefix}/${repo_version}/rpm/${repo_dir}",
          gpgkey   => "${repo_prefix}/${repo_version}/rpm/app+linux@eduvpn.org.asc",
          gpgcheck => true,
          enabled  => true,
        }
      }
      default: {
        fail("Unknown os.family fact ${facts['os']['family']}, not supported")
      }
    }
  }
}
