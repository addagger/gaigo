# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gaigo/version'

Gem::Specification.new do |gem|
  gem.name          = "gaigo"
  gem.version       = Gaigo::VERSION
  gem.authors       = ["Valery Kvon"]
  gem.email         = ["addagger@gmail.com"]
  gem.homepage      = %q{http://vkvon.ru/projects/gaigo}
  gem.description   = %q{76 world's languages and codes}
  gem.summary       = %q{World's languages/countries, localization for Rails' models}

  gem.rubyforge_project = "gaigo"

  gem.add_development_dependency "i18n"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.licenses       = ['MIT']
end