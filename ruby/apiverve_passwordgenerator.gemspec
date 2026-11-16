# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "apiverve_passwordgenerator"
  spec.version       = "1.2.6"
  spec.authors       = ["APIVerve"]
  spec.email         = ["hello@apiverve.com"]

  spec.summary       = "Password Generator API - Ruby Client"
  spec.description   = "Password Generator is a password generator API that creates random passwords, pronounceable passwords and multi-word passphrases from length, complexity and character-set rules, up to 100 per call. Each comes back with its length and the settings used to build it."
  spec.homepage      = "https://apiverve.com/marketplace/passwordgenerator?utm_source=ruby&utm_medium=referral&utm_content=homepage"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/apiverve/passwordgenerator-API/tree/main/ruby"
  spec.metadata["changelog_uri"] = "https://apiverve.com/changelog"
  spec.metadata["documentation_uri"] = "https://docs.apiverve.com/ref/passwordgenerator"

  spec.files = Dir.glob("{lib}/**/*") + %w[README.md LICENSE]
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", ">= 1.0", "< 3.0"
  spec.add_dependency "faraday-multipart", "~> 1.0"
  spec.add_dependency "json", "~> 2.0"
end
