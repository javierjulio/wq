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
              meanings.each_with_index do |meaning, index|
                # synonyms = meaning[:synonyms].map.with_index { |s, i| (i == 0) ? s.upcase : s }.compact.join(", ")
                synonyms = meaning[:synonyms].compact.join(", ")

                puts colors.white(meaning[:definition])# + " " + synonyms

                # puts colors.gray(colors.italics(meaning[:example])) + " " + colors.white(synonyms)
                # puts [colors.white("\u{2503}"), colors.gray(meaning[:example]), colors.white(synonyms)].join(" ")
                puts ['"', meaning[:example], '"'].join
                puts [colors.bright_white("\u{21BB}"), synonyms].join(" ") if !meaning[:synonyms].empty?

                # puts [colors.white("\u{21AA}"), colors.gray(meaning[:example]), colors.white(synonyms)].join(" ")
                # puts "\u{2295} #{synonyms}" if !meaning[:synonyms].empty?
                # puts ["💬", colors.gray(meaning[:example])].join(" ")
                # puts colors.gray("🔄 #{synonyms}") if !meaning[:synonyms].empty?
                # puts ['"', colors.gray(meaning[:example]), '"'].join
                # puts "> #{colors.gray(meaning[:example])}"
                # puts colors.gray("🔄 " + meaning[:synonyms].join(", ")) if !meaning[:synonyms].empty?
                puts "" if index < meanings.size - 1
              end
            end
            puts ""
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
