# frozen_string_literal: true

RSpec.describe Wq::Data do
  describe ".words_path" do
    it "returns path to words.json file" do
      expect(described_class.words_path).to eq(File.expand_path("../../data/words.json", __FILE__))
    end
  end

  describe ".words" do
    let(:words) { described_class.words }

    it "returns words as an array of hashes" do
      expect(words).to be_an(Array)
      expect(words).not_to be_empty
      expect(words).to all(be_a(Hash))
    end

    it "has a unique, non-blank word with at least one meaning for every entry" do
      words.each do |word|
        expect(word.keys).to contain_exactly(:word, :meanings), "unexpected keys for #{word.inspect}"
        expect(word[:word]).to be_a(String).and(match(/\S/))
        expect(word[:meanings]).to be_an(Array).and(be_any), "no meanings for #{word[:word]}"
      end

      expect(words.map { |w| w[:word] }).to eq(words.map { |w| w[:word] }.uniq)
    end

    it "has well-formed meanings for every word" do
      words.each do |word|
        word[:meanings].each do |meaning|
          context = "#{word[:word]}: #{meaning.inspect}"
          expect(meaning.keys).to contain_exactly(:definition, :partOfSpeech, :example, :synonyms), context
          expect(meaning[:definition]).to be_a(String).and(match(/\S/)), context
          expect(meaning[:example]).to be_a(String).and(match(/\S/)), context
          expect(%w[noun verb adjective adverb]).to include(meaning[:partOfSpeech]), context
          expect(meaning[:synonyms]).to be_an(Array).and(all(be_a(String))), context
        end
      end
    end
  end

  describe ".quotes_path" do
    it "returns path to quotes.json file" do
      expect(described_class.quotes_path).to eq(File.expand_path("../../data/quotes.json", __FILE__))
    end
  end

  describe ".quotes" do
    it "returns quotes as an array of hashes with text and author" do
      quotes = described_class.quotes
      expect(quotes).to be_an(Array)
      expect(quotes).not_to be_empty

      quotes.each do |quote|
        expect(quote).to be_a(Hash)
        expect(quote.keys).to contain_exactly(:text, :author), "unexpected keys for #{quote.inspect}"
        expect(quote[:text]).to be_a(String).and(match(/\S/)), quote.inspect
        expect(quote[:author]).to be_a(String), quote.inspect
      end
    end
  end
end
