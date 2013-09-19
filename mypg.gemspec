require File.expand_path('../lib/mypg/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Felipe Bazzarella"]
  gem.email         = ["fbazzarella@gmail.com"]
  gem.description   = %q{Dump and restore PostgreSQL's structure and data.}
  gem.summary       = %q{Dump and restore PostgreSQL's structure and data.}
  gem.homepage      = 'https://github.com/fbazzarella/mypg'
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.name          = "mypg"
  gem.require_paths = ["lib"]
  gem.version       = Mypg::VERSION

  gem.add_runtime_dependency('colored', '~> 1.2')
end
