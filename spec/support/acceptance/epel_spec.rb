# frozen_string_literal: true

configure_beaker do |host|
  install_package(host, 'epel-release') if (fact_on(host, 'os.family') == 'RedHat') && (fact_on('host', 'os.name') != 'Fedora')
end
