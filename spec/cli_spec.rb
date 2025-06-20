require "wq/cli"

RSpec.describe Wq::CLI do
  describe "command_name" do
    it "returns 'wq'" do
      expect(described_class.command_name).to eq("wq")
    end
  end

  describe "version" do
    it "returns the version" do
      expect(described_class.version).to eq(Wq::VERSION)
    end
  end
end
