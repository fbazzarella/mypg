require File.expand_path('../lib/mypg/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Felipe Bazzarella"]
  gem.email         = ["fbazzarella@gmail.com"]
  gem.description   = %q{Dump and restore PostgreSQL's structure and data.}

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "mypg"
  gem.require_paths = ["lib"]
  gem.version       = Mypg::VERSION

  gem.add_runtime_dependency('colored', '~> 1.2')
end
