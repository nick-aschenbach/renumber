require 'spec_helper'

describe Renumber do
  subject { Class.new { extend Renumber } }

  describe '.files' do
    let(:path) { '.' }
    let(:file_list) { ['.', '..', 'foo.txt', 'directory', '01.txt'] }
    let(:which_are_files) { [false, false, true, false, true] }
    let(:expected_files) { ['01.txt', 'foo.txt'] }

    it 'returns a sorted list of files and ignores directories' do
      expect(File).to receive(:directory?).with(path).and_return(true)
      expect(Dir).to receive(:entries).with('.').and_return(file_list)
      expect(File).to receive(:file?).and_return(*which_are_files)

      expect(subject.sorted_files(path)).to eq(expected_files)
    end

    it 'changes to the specified directory' do
      allow(File).to receive(:rename)
      expect(Dir).to receive(:chdir).with(path)

      subject.sorted_files(path)
    end

    context 'when the path is not a directory' do
      let(:path) { 'foobar.txt' }

      before do
        allow(File).to receive(:directory?).with(path).and_return(false)
      end

      it 'raises an error' do
        expect {
          subject.sorted_files(path)
        }.to raise_exception(ArgumentError, 'path must be a directory')
      end
    end
  end

  describe '.change_files' do
    let(:path) { '.' }

    it 'gets a list of sorted files' do
      expect(subject).to receive(:sorted_files).with(path).and_return([])

      subject.change_files(path)
    end

    it 'returns early when no files are returned' do
      allow(subject).to receive(:sorted_files).with(path).and_return([])
      expect(Math).to_not receive(:log10)

      subject.change_files(path)
    end

    describe 'prefixes and suffixes' do
      let(:sorted_files) { ['01.txt', 'foo.txt'] }

      before do
        allow(subject).to receive(:sorted_files).with(path).and_return(sorted_files)
      end

      context 'with no prefix or suffix' do
        it 'renames files to be numbers' do
          expect(File).to receive(:rename).with(sorted_files[0], '0').ordered
          expect(File).to receive(:rename).with(sorted_files[1], '1').ordered

          subject.change_files(path)
        end
      end

      context 'when there is a prefix' do
        it 'renames files to be numbers with a prefix' do
          expect(File).to receive(:rename).with(sorted_files[0], 'foo0').ordered
          expect(File).to receive(:rename).with(sorted_files[1], 'foo1').ordered

          subject.change_files(path, 'foo')
        end
      end

      context 'when there is a prefix and a suffix' do
        it 'renames files to be numbers with a prefix' do
          expect(File).to receive(:rename).with(sorted_files[0], 'foo0.txt').ordered
          expect(File).to receive(:rename).with(sorted_files[1], 'foo1.txt').ordered

          subject.change_files(path, 'foo', '.txt')
        end
      end
    end
  end
end