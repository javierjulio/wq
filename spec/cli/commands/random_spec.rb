require "wq/cli/commands/random"

RSpec.describe Wq::CLI::Commands::Random do
  describe "command_name" do
    it "returns 'random'" do
      expect(described_class.command_name).to eq("random")
    end
  end

  describe "description" do
    it "returns the description" do
      expect(described_class.description).to eq("Show random word.")
    end
  end

  describe "run" do
    it "outputs a random word with its meanings" do
      word = {
        word: "example",
        meanings: [
          {
            partOfSpeech: "noun",
            definition: "A representative form or pattern.",
            example: "This is an example sentence.",
            synonyms: ["model", "specimen"]
          }
        ]
      }

      expect(Wq::Data).to receive(:words).and_return([word])

      expected_output = [
        "",
        "example",
        "",
        "noun",
        "",
        "  A representative form or pattern.",
        "  This is an example sentence. MODEL, specimen",
        "",
        ""
      ].join($/)
      expect { subject.run }.to output(expected_output).to_stdout
    end
  end
end
