module Wq
  class CLI
    module Commands
      class Inspire < CommandKit::Command
        include CommandKit::Printing::Indent
        include CommandKit::Colors

        command_name 'inspire'
        description 'Show random inspirational quote.'

        def run
          puts ""
          indent(2) do
            puts colors.white("\"#{quote[:text]}\"")
            puts colors.gray("-- #{quote[:author]}")
          end
          puts ""
        end

        def quote
          @quote ||= Wq::Data.quotes.sample
        end
      end
    end
  end
end
