# @api private
class eduvpn::install {
  package { 'eduvpn-client':
    ensure => installed,
  }
}
