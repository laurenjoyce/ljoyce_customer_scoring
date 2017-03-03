# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ljoyce_customer_scoring/version'

Gem::Specification.new do |spec|
  spec.name          = "ljoyce_customer_scoring"
  spec.version       = LjoyceCustomerScoring::VERSION
  spec.authors       = ["Lauren Joyce"]
  spec.email         = ["joycelc4186@gmail.com"]

  spec.summary       = %q{Mock consumer scoring}
  spec.description   = %q{Returns consumer propensity and ranking JSON data based on income, zipcode, and age.}
  spec.homepage      = "https://github.com/laurenjoyce/ljoyce_customer_scoring"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "unirest", "~> 1.1.2"

  spec.required_ruby_version = '~> 2.2.0'
end
