# frozen_string_literal: true

RSpec.describe Wq::Data do
  it "returns path to words.json file" do
    expect(described_class.words_path).to eq(File.expand_path("../../data/words.json", __FILE__))
  end

  it "returns words as an array of hashes" do
    words = described_class.words
    expect(words).to be_an(Array)

    word = words.first
    expect(word).to be_a(Hash)
    expect(word.keys).to contain_exactly(:word, :meanings)
    expect(word[:meanings].first.keys).to contain_exactly(:definition, :partOfSpeech, :example, :synonyms)
    expect(word[:meanings].first[:synonyms]).to be_an(Array)
    expect(word[:meanings].first[:synonyms].first).to be_a(String)
  end

  it "returns path to quotes.json file" do
    expect(described_class.quotes_path).to eq(File.expand_path("../../data/quotes.json", __FILE__))
  end

  it "returns quotes as an array of hashes" do
    quotes = described_class.quotes
    expect(quotes).to be_an(Array)

    quote = quotes.first
    expect(quote).to be_a(Hash)
    expect(quote.keys).to contain_exactly(:text, :author)
    expect(quote[:text]).to be_a(String)
    expect(quote[:author]).to be_a(String)
  end
end
