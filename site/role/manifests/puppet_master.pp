class role::puppet_master {
  include profile::hiera
  include profile::cowsay
}
