# frozen_string_literal: true

require_relative "lib/round_robin_recommendation/version"

Gem::Specification.new do |spec|
  spec.name          = "round_robin_recommendation"
  spec.version       = RoundRobinRecommendation::VERSION
  spec.authors       = ["Keiny Pacheco"]
  spec.email         = [""]

  spec.summary       = "Algorithm recommendations using Round-Robin approach"
  spec.description   = "Show 4 recommended articles for a particular article. We need to get an Array(4) with the most homegenous list of recommendations, based in a Round-Robin approach"
  spec.homepage      = "https://github.com/keinydev/round_robin_recommendation"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.4.0"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "rspec", "~> 3.0"
end
