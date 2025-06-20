# frozen_string_literal: true

module Wq
  module Data
    PATH = File.expand_path("../../../data", __FILE__)

    def self.words
      JSON.parse(File.read(words_path), symbolize_names: true)
    end

    def self.words_path
      File.join(PATH, "words.json")
    end

    def self.quotes
      JSON.parse(File.read(quotes_path), symbolize_names: true)
    end

    def self.quotes_path
      File.join(PATH, "quotes.json")
    end
  end
end
