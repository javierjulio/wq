RSpec.describe CommandKit::Colors::ANSI do
  describe ".italics" do
    context "when given a string" do
      it "returns the string wrapped in italics ANSI codes" do
        expect(described_class.italics("Hello")).to eq("\e[3mHello\e[23m")
      end
    end

    context "when given no arguments" do
      it "returns the italics ANSI code" do
        expect(described_class.italics).to eq("\e[3m")
      end
    end
  end
end
