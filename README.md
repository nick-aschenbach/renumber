# Renumber

This simple utility allows renaming non-sequential files to be sequentially numbered.
For example given input files: input00.txt, input03.txt, input99.txt it changes their
name to: f0.text, f1.text, f2.text

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'renumber'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install renumber

## Usage

Given

$ renumber directory_name [prefix] [suffix]

## Contributing

1. Fork it ( https://github.com/[my-github-username]/renumber/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
