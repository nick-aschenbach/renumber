require 'renumber/version'

module Renumber
  def sorted_files(path)
    raise ArgumentError, 'path must be a directory' unless File.directory?(path)

    Dir.chdir(path)

    file_entries_from_path(path).sort
  end

  def change_files(path, prefix=nil, suffix=nil)
    sorted_files = sorted_files(path)
    return if sorted_files.length == 0

    zeros_length = Math.log10(sorted_files.length).ceil

    sorted_files.each_with_index do |file, index|
      File.rename(file, "#{prefix}#{index.to_s.rjust(zeros_length, '0')}#{suffix}")
    end
  end

  private

  def file_entries_from_path(path)
    Dir.entries(path).select { |file| File.file?(file) }
  end
end
