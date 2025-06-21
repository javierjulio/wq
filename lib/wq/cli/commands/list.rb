module Wq
  class CLI
    module Commands
      class List < CommandKit::Command
        include CommandKit::Printing::Indent
        include CommandKit::Colors

        command_name 'list'
        description 'Show all or filtered words.'

        argument :letter, required: false, usage: 'A', desc: "The starting letter to filter words by."

        def run(letter=nil)
          if letter.nil?
            words = Wq::Data.words
          else
            words = Wq::Data.words.select { |w| w[:word].start_with?(letter.downcase) }
          end

          if words.empty?
            print_error("No words found starting with '#{letter.downcase}'.")
            exit 1
          else
            words.each do |word|
              puts "#{word[:word]} - #{word[:meanings].first[:definition]}"
            end
          end
        end
      end
    end
  end
end
