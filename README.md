# Renumber

This simple utility allows renaming non-sequential files to be sequentially numbered.

For example given input files: `input00.txt`, `input03.txt`, `input99.txt` it can change their
names to: `f0.text`, `f1.text`, `f2.text`

## Installation

Add the command line utility using Ruby's gem command:

    $ gem install renumber

## Usage

From the command line specify a directory name and optional prefix and suffix:

    $ renumber directory_name [prefix] [suffix]

## Contributing

1. Fork it ( https://github.com/[my-github-username]/renumber/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
