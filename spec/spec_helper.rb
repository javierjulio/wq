# frozen_string_literal: true

if ENV.fetch("COVERAGE", false)
  require "simplecov"
  require "simplecov-cobertura"
  SimpleCov.start do
    add_filter %r{^/spec/}
    formatter SimpleCov::Formatter::CoberturaFormatter
  end
end

require "wq"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.order = :random
end
