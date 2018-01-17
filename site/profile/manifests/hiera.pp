class profile::hiera {
  class { 'hiera':
    hiera_version        =>  '5',
    hiera5_defaults      =>  {"datadir" => "/etc/puppetlabs/code/environments/%{::environment}/hieradata", "data_hash" => "yaml_data"},
    hierarchy            =>  [
      {"name" => "Nodes yaml", "paths" =>  ['nodes/%{::trusted.certname}.yaml', 'nodes/%{::osfamily}.yaml']},
      {"name" => "Default yaml file", "path" =>  "common.yaml"},
    ],
    eyaml                =>  true,
    eyaml_gpg            =>  true,
    eyaml_gpg_recipients =>  'mark@example.com,chris@example.com',
    create_keys          =>  false,
    keysdir              =>  '/etc/puppetlabs/code-staging/keys',
    provider             =>  puppetserver_gem,
  }


  package { 'cowsay': }
}
