# Wq

`wq` is a CLI built with [command_kit](https://github.com/postmodern/command_kit.rb), to help you (me) learn ~500 words you should know but probably don't and find inspiration from a curated list of quotes.

## Usage

Run `gem install wq` then `wq` for the CLI.

- `wq today` shows the word and quote of the day
- `wq random` shows a random word
- `wq inspire` shows a random inspirational quote
- `wq list [A-Z]` lists all or filtered words

## Development

Run `bundle install` and then `bundle exec rspec` to run tests.

Only a list of words were extracted from the book ["500 Words You Should Know" by Caroline Taggart](https://www.goodreads.com/book/show/23359837-500-words-you-should-know). From there [Google Gemini (2.5 Pro)](https://gemini.google.com) was used to generate the meanings per word in JSON format.

This is an example of the Gemini prompt template used:
> Generate a JSON array of objects that provide the meanings for the words listed below. A word can have multiple meanings. Each meaning should include the definition, part of speech, example, and synonyms.
>
> bacchanalian, badinage, bathos, bellwether, benevolent, blatant, blighting, bombastic, boorish, bucolic, burgeoning, byzantine

The quotes data source is [the dwyl/quotes repository](https://github.com/dwyl/quotes/blob/main/quotes.json). Run `bin/update-quotes` to update the data file and commit the changes.

## Releases

To release a new version, bump the version number in `version.rb`, run `bundle install`, and then `bundle exec rake release`.

## Resources

- https://www.datamuse.com/api/#md
- https://github.com/agmmnn/datamuse-cli/blob/master/datamuse_cli/cli.py

```ruby
response = Net::HTTP.get_response(URI.parse("https://api.datamuse.com/words?rel_jjb=ocean&max=20"))
JSON.parse(response.body, symbolize_names: true)
```
