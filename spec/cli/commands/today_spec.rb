require "wq/cli/commands/today"

RSpec.describe Wq::CLI::Commands::Today do
  describe ".command_name" do
    it "returns 'today'" do
      expect(described_class.command_name).to eq("today")
    end
  end

  describe ".description" do
    it "returns the description" do
      expect(described_class.description).to eq("Show the word and quote of the day.")
    end
  end

  describe "#random_today" do
    it "returns a Random instance seeded with today's date" do
      expect(subject.random_today).to eq Random.new(Date.today.to_s.delete("-").to_i)
    end
  end

  describe "#run" do
    it "outputs the word and quote of the day" do
      word = {
        word: "example",
        meanings: [
          {
            partOfSpeech: "noun",
            definition: "A representative form or pattern.",
            example: "This is an example sentence."
          }
        ]
      }
      expect(Wq::Data).to receive(:words).and_return([word])

      quote = { author: "Example Author", text: "This is an example." }
      expect(Wq::Data).to receive(:quotes).and_return([quote])

      expected_output = [
        "📚 Word of the Day",
        "",
        "example",
        "",
        "noun",
        "",
        "  A representative form or pattern.",
        "  \"This is an example sentence.\"",
        "  ",
        "",
        "💬 Quote of the Day",
        "",
        "  \"This is an example.\"",
        "  -— Example Author",
        ""
      ].join($/)
      expect { subject.run }.to output(expected_output).to_stdout
    end
  end
end
