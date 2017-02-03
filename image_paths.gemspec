# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'image_paths/version'

Gem::Specification.new do |spec|
  spec.name          = "image_paths"
  spec.version       = ImagePaths::VERSION
  spec.authors       = ["Aleksei Ivanishchev"]
  spec.email         = ["zoneiva@gmail.com"]

  spec.summary       = "This is an example!"
  # %q{TODO: Write a short summary, because Rubygems requires one.}
  spec.description   = 'Easy collect source paths of all images on HTML page'
    # %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = 'https://github.com/ruby/rake'
  # "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", '~> 0' #, "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "guard", '~> 0'#, "~> 3.0"
  spec.add_development_dependency "guard-rspec", '~> 0'#, "~> 3.0"

  spec.add_runtime_dependency "nokogiri", '~> 1.7'# , ["= 1.1.0"]
  spec.add_runtime_dependency "httparty", '~> 0'#, "~> 3.0"

end


# gem install httparty
