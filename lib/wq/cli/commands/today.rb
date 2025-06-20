module Wq
  class CLI
    module Commands
      class Today < CommandKit::Command
        include CommandKit::Printing::Indent
        include CommandKit::Colors

        command_name 'today'
        description 'Show the word and quote of the day.'

        def run
          random_today = Random.new(Date.today.to_s.delete("-").to_i)
          word = Wq::Data.words.sample(random: random_today)
          quote = Wq::Data.quotes.sample(random: random_today)

# 📘 Word of the Day: *ephemeral* (adj.)
# Definition: Lasting for a very short time.
# Example: "Fame in the world of pop music is largely ephemeral."

# 💬 Quote of the Day:
# "Learning never exhausts the mind." — Leonardo da Vinci

          puts "📚 Word of the Day"
          puts ""

          grouped = word[:meanings].group_by { |w| w[:partOfSpeech] }
          # indent(2) do
            puts colors.yellow(colors.bold(word[:word]))
            puts ""
            grouped.each do |part_of_speech, meanings|
              puts colors.gray(part_of_speech)
              puts ""
              indent(2) do
                meanings.each_with_index do |meaning, index|
                  puts colors.white(meaning[:definition])
                  # puts [colors.white(meaning[:definition]), colors.gray(meaning[:example])].join(" ")
                  puts colors.gray(colors.italics(meaning[:example]))
                  # puts "| #{colors.gray(meaning[:example])}"
                  # puts ['"', colors.gray(meaning[:example]), '"'].join
                  # puts "> #{colors.gray(meaning[:example])}"
                  puts "" if index < meanings.size - 1
                end
              end
              puts ""
            # end
          end

          # indent(2) do
          #   puts colors.yellow("#{word[:word]}")
          #   puts ""
          #   puts colors.gray("#{word[:meanings].first[:partOfSpeech]}")
          #   puts ""
          #   indent(2) do
          #     puts colors.white(word[:meanings].first[:definition])
          #     puts colors.gray("#{word[:meanings].first[:example]}")
          #   end
          #   puts ""
          # end

          puts ""
          puts "💬 Quote of the Day"
          puts ""
          indent(2) do
            puts colors.white("\"#{quote[:text]}\"")
            puts colors.gray("-— #{quote[:author]}")
          end
          puts ""
        end
      end
    end
  end
end
