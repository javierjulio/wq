# Wq

A `wq` CLI to help you learn 500+ words you should know but probably don't and find inspirational quotes.

## Usage

Run `gem install wq`

And then `wq`

## Development

Run `bundle install` and then `bundle exec rspec` to run tests.

Only a list of words were extracted from the book "500 Words You Should Know" by Caroline Taggart. From there Google Gemini was used to generate the meanings per word in JSON format.

This is an example of the Gemini prompt template used:
> Generate a JSON array of objects that provide the meanings for the words listed below. A word can have multiple meanings. Each meaning should include the definition, part of speech, example, and synonyms.
>
> bacchanalian, badinage, bathos, bellwether, benevolent, blatant, blighting, bombastic, boorish, bucolic, burgeoning, byzantine

## Releases

To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`.

## Resources

- https://www.datamuse.com/api/#md
- https://github.com/agmmnn/datamuse-cli/blob/master/datamuse_cli/cli.py
- https://github.com/dwyl/quotes/blob/main/quotes.json
- https://github.com/Musheer360/QuoteSlate/blob/main/data/quotes.json
