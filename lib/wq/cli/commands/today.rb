module Wq
  class CLI
    module Commands
      class Today < CommandKit::Command
        include CommandKit::Printing::Indent
        include CommandKit::Colors

        command_name 'today'
        description 'Show the word and quote of the day.'

        def run
          puts "📚 Word of the Day"
          puts ""
          puts colors.yellow(colors.bold(word[:word]))
          puts ""
          grouped_meanings.each do |part_of_speech, meanings|
            puts part_of_speech
            puts ""
            indent(2) do
              meanings.each do |meaning|
                puts colors.white(meaning[:definition])
                puts colors.gray(['"', meaning[:example], '"'].join)
                puts ""
              end
            end
          end
          puts ""
          puts "💬 Quote of the Day"
          puts ""
          indent(2) do
            puts "\"#{quote[:text]}\""
            puts colors.gray("-— #{quote[:author]}")
          end
        end

        def random_today
          @random_today ||= ::Random.new(Date.today.to_s.delete("-").to_i)
        end

        def word
          @word ||= Wq::Data.words.sample(random: random_today)
        end

        def grouped_meanings
          word[:meanings].group_by { |w| w[:partOfSpeech] }
        end

        def quote
          @quote ||= Wq::Data.quotes.sample(random: random_today)
        end
      end
    end
  end
end
