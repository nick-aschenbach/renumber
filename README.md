# Renumber

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/renumber`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

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

```ruby
require 'renumber'
include Renumber

sorted_files '.' # -> 0, 3, 4

change_files '.', 'prefix', '.txt' # -> prefix0.txt, prefix1.txt, prefix2.txt
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/renumber/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
