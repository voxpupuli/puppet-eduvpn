# frozen_string_literal: true

require 'spec_helper'

describe 'eduvpn' do
  context 'supported operating systems' do
    on_supported_os.each do |os, os_facts|
      context "on #{os}" do
        let(:facts) { os_facts }

        it { is_expected.to compile.with_all_deps }

        it {
          is_expected.to contain_class('Eduvpn::Repos')
          is_expected.to contain_class('Eduvpn::Install')
          is_expected.to contain_package('eduvpn-client').with_ensure('installed')
        }

        case os_facts[:os]['family']
        when 'Debian'
          it {
            is_expected.to contain_apt__keyring('eduvpn-v4.gpg')
            is_expected.to contain_apt__source('eduvpn-v4')
          }
        else
          it {
            is_expected.to contain_yumrepo('python-eduvpn-client')
          }
        end

        context 'when manage_repos is false' do
          let(:params) do
            { manage_repos: false }
          end

          it {
            is_expected.to contain_package('eduvpn-client').with_ensure('installed')
            is_expected.not_to contain_apt__keyring('eduvpn-v4.gpg')
            is_expected.not_to contain_apt__source('eduvpn-v4')
            is_expected.not_to contain_yumrepo('python-eduvpn-client')
          }
        end

        context 'when repository strings are set' do
          let(:params) do
            {
              dist_dir: 'minix-powerpc',
              repo_prefix: 'https://example.org',
              repo_version: 'v4-dev',
            }
          end

          case os_facts[:os]['family']
          when 'Debian'
            it {
              is_expected.to contain_apt__keyring('eduvpn-v4-dev.gpg').with(
                {
                  source: 'https://example.org/v4-dev/deb/app+linux@eduvpn.org.gpg',
                }
              )
              is_expected.to contain_apt__source('eduvpn-v4-dev').with(
                {
                  location: 'https://example.org/v4-dev/deb/',
                  keyring: '/etc/apt/keyrings/eduvpn-v4-dev.gpg',
                }
              )
            }
          else
            it {
              is_expected.to contain_yumrepo('python-eduvpn-client').with(
                {
                  baseurl: 'https://example.org/v4-dev/rpm/minix-powerpc',
                  gpgkey: 'https://example.org/v4-dev/rpm/app+linux@eduvpn.org.asc',
                }
              )
            }
          end
        end
      end
    end
  end
end
