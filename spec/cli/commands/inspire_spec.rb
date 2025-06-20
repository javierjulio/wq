require "wq/cli/commands/inspire"

RSpec.describe Wq::CLI::Commands::Inspire do
  describe "command_name" do
    it "returns 'inspire'" do
      expect(described_class.command_name).to eq("inspire")
    end
  end

  describe "description" do
    it "returns the description" do
      expect(described_class.description).to eq("Show random inspirational quote.")
    end
  end

  it "outputs random sampled quotes" do
    srand 2

    data = [{ text: "A", author: "B" }, { text: "C", author: "D" }].freeze
    expect(Wq::Data).to receive(:quotes).twice.and_return(data)

    expect { described_class.new.run }.to output(["", '  "A"', "  -- B", "", ""].join($/)).to_stdout
    expect { described_class.new.run }.to output(["", '  "C"', "  -- D", "", ""].join($/)).to_stdout

    srand RSpec.configuration.seed
  end

  it "outputs a formatted quote text and author" do
    expect(Wq::Data).to receive(:quotes).and_return([{ text: "Quote Text", author: "Author Name" }])

    string = [
      "",
      '  "Quote Text"',
      "  -- Author Name",
      "",
      ""
    ].join($/)

    expect { subject.run }.to output(string).to_stdout
  end
end
