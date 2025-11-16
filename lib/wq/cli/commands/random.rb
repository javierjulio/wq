module Wq
  class CLI
    module Commands
      class Random < CommandKit::Command
        include CommandKit::Printing::Indent
        include CommandKit::Colors

        command_name 'random'
        description 'Show random word.'

        def run
          puts ""
          puts colors.yellow(colors.bold(word[:word]))
          puts ""

          grouped_meanings.each do |part_of_speech, meanings|
            puts part_of_speech
            puts ""
            indent(2) do
              meanings.each do |meaning|
                puts colors.white(meaning[:definition])
                puts ['"', meaning[:example], '"'].join

                synonyms = meaning[:synonyms].compact.join(", ")
                puts ["\u{21BB}", synonyms].join(" ") if !meaning[:synonyms].empty?

                puts ""
              end
            end
          end
        end

        def word
          @word ||= Wq::Data.words.sample
        end

        def grouped_meanings
          word[:meanings].group_by { |w| w[:partOfSpeech] }
        end
      end
    end
  end
end
