RSpec.describe CommandKit::Colors do
  describe CommandKit::Colors::ANSI do
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

  describe CommandKit::Colors::PlainText do
    describe ".italics" do
      context "when given a string" do
        it "returns the string as-is" do
          expect(described_class.italics("Hello")).to eq("Hello")
        end
      end

      context "when given no arguments" do
        it "returns an empty string" do
          expect(described_class.italics).to eq("")
        end
      end
    end
  end
end
