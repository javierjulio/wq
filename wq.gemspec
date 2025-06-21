# frozen_string_literal: true

require_relative "lib/wq/version"

Gem::Specification.new do |spec|
  spec.name = "wq"
  spec.version = Wq::VERSION
  spec.authors = ["Javier Julio"]
  spec.email = ["jjfutbol@gmail.com"]

  spec.summary = "A CLI (wq) to learn 500+ words and inspirational quotes."
  spec.description = "A command-line tool (wq) to help you learn 500+ words you should know but probably don't and find inspirational quotes."
  spec.homepage = "https://github.com/javierjulio/wq"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "#{spec.homepage}.git"
  spec.metadata["bug_tracker_uri"] = "#{spec.homepage}/issues"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir["README.md", "LICENSE*", "lib/**/*.rb", "data/*.json", "exe/*"]
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "command_kit", "~> 0.6"
end
