require "command_kit"
require "command_kit/commands"
require "command_kit/commands/auto_load"
require "command_kit/colors"
require "command_kit/printing/indent"
require "command_kit/options/version"
require_relative "cli/colors_ext"

module Wq
  class CLI
    include CommandKit::Commands
    include CommandKit::Commands::AutoLoad.new(
      dir: "#{__dir__}/cli/commands",
      namespace: "#{self}::Commands",
    )
    include CommandKit::Options::Version

    command_name "wq"
    version Wq::VERSION
  end
end
