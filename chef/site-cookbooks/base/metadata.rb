name 'base'
version '0.1.0'
chef_version '>= 13.1' if respond_to?(:chef_version)

depends 'docker'
depends 'sudo'
