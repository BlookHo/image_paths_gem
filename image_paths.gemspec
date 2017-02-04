# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'image_paths/version'

Gem::Specification.new do |spec|
  spec.name          = 'image_paths'
  spec.version       = ImagePaths::VERSION
  spec.authors       = ['Aleksei Ivanishchev']
  spec.email         = ['zoneiva@gmail.com']

  spec.summary       = "useage: ImagePaths.at('path')"
  spec.description   = 'Easy collect source paths of all images on HTML page'
  spec.homepage      = 'https://github.com/BlookHo/image_paths_gem'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org.
  # To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://github.com/BlookHo/image_paths_gem'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'guard', '~> 0'
  spec.add_development_dependency 'guard-rspec', '~> 0'
  spec.add_development_dependency 'rubocop', '~> 0'

  spec.add_runtime_dependency 'nokogiri', '~> 1.7'
  spec.add_runtime_dependency 'httparty', '~> 0'

end
