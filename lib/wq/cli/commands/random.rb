module Wq
  class CLI
    module Commands
      class Random < CommandKit::Command
        include CommandKit::Printing::Indent
        include CommandKit::Colors

        command_name 'random'
        description 'Show random word.'

        def run
          grouped = word[:meanings].group_by { |w| w[:partOfSpeech] }
          # indent(2) do
            puts ""
            puts colors.yellow(colors.bold(word[:word]))
            puts ""
            grouped.each do |part_of_speech, meanings|
              puts colors.gray(part_of_speech)
              puts ""
              indent(2) do
                meanings.each_with_index do |meaning, index|
                  puts colors.white(meaning[:definition])
                  # puts [colors.white(meaning[:definition]), colors.gray(meaning[:example])].join(" ")

                  synonyms = meaning[:synonyms].map.with_index { |s, i| (i == 0) ? s.upcase : s }.compact.join(", ")

                  puts colors.gray(colors.italics(meaning[:example])) + " " + colors.white(synonyms)
                  # puts "| #{colors.gray(meaning[:example])}"
                  # puts ['"', colors.gray(meaning[:example]), '"'].join
                  # puts "> #{colors.gray(meaning[:example])}"
                  # puts colors.gray(">> " + meaning[:synonyms].join(", ")) if !meaning[:synonyms].empty?
                  puts "" if index < meanings.size - 1
                end
              end
              puts ""
            end
          # end
        end

        def word
          @word ||= Wq::Data.words.sample
        end
      end
    end
  end
end
