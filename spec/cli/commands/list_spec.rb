require "wq/cli/commands/list"

RSpec.describe Wq::CLI::Commands::List do
  describe ".command_name" do
    it "returns 'list'" do
      expect(described_class.command_name).to eq("list")
    end
  end

  describe ".description" do
    it "returns the description" do
      expect(described_class.description).to eq("Show all or filtered words.")
    end
  end

  describe "#run" do
    let(:words) do
      [
        { word: "apple", meanings: [{ definition: "A fruit" }] },
        { word: "banana", meanings: [{ definition: "Another fruit" }] },
        { word: "apricot", meanings: [{ definition: "A small fruit" }] }
      ]
    end

    it "outputs all words when no letter argument is provided" do
      expect(Wq::Data).to receive(:words).and_return(words)

      expected_output = [
        "apple - A fruit",
        "banana - Another fruit",
        "apricot - A small fruit",
        ""
      ].join($/)
      expect { subject.run }.to output(expected_output).to_stdout
    end

    it "outputs filtered words when a letter argument is provided" do
      expect(Wq::Data).to receive(:words).and_return(words)

      expected_output = [
        "apple - A fruit",
        "apricot - A small fruit",
        ""
      ].join($/)
      expect { subject.run("a") }.to output(expected_output).to_stdout
    end

    it "outputs a message when no words are found for the given letter" do
      expect(Wq::Data).to receive(:words).and_return(words)

      expect(subject).to receive(:print_error).with("No words found starting with 'c'.")

      expect { subject.run("c") }.to raise_error(SystemExit) do |error|
        expect(error.status).to eq(1)
      end
    end
  end
end
