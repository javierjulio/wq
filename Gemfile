# frozen_string_literal: true

source "https://rubygems.org"

# Specify your gem's dependencies in wq.gemspec
gemspec

gem "irb"
gem "rake", "~> 13.0"
gem "rspec", "~> 3.0"

# For bin/update-quotes script
gem "json"
gem "net-http"
gem "openssl" # Avoid SSL verify error with 3.3.0 default gem version

group :test do
  gem "simplecov", require: false
  gem "simplecov-cobertura"
end
