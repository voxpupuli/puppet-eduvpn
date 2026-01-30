# @api private
#
class eduvpn::repos (
  Boolean $manage_repos = $eduvpn::manage_repos,
  String[1] $repo_version = $eduvpn::repo_version,
  Stdlib::Httpsurl $repo_prefix = $eduvpn::repo_prefix,
  Optional[String[1]] $dist_dir = $eduvpn::dist_dir,
) {
  if $manage_repos {
    case $facts['os']['family'] {
      'RedHat': {
        yumrepo { 'python-eduvpn-client':
          descr    => "eduVPN for Linux ${repo_version}",
          baseurl  => "${repo_prefix}/${repo_version}/rpm/${dist_dir}",
          gpgkey   => "${repo_prefix}/${repo_version}/rpm/app+linux@eduvpn.org.asc",
          gpgcheck => true,
          enabled  => true,
        }
      }
      'Debian': {
        apt::keyring { "eduvpn-${repo_version}.gpg":
          source => "${repo_prefix}/${repo_version}/deb/app+linux@eduvpn.org.gpg",
        }
        apt::source { "eduvpn-${repo_version}":
          comment  => "eduVPN for Linux ${repo_version}",
          types    => ['deb'],
          location => "${repo_prefix}/${repo_version}/deb/",
          repos    => ['main'],
          keyring  => "/etc/apt/keyrings/eduvpn-${repo_version}.gpg",
        }
      }
      default: {
        fail("Unknown os.family fact ${facts['os']['family']}, not supported")
      }
    }
  }
}
