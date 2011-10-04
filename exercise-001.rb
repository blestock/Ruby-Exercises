#!/usr/bin/env ruby

# This is almost the same. This time, however, we're going to split the string
# on white space (spaces, new lines, tabs) and print each word individually.

# Documentation:
# - For String.split: http://ruby-doc.org/core/classes/String.html#M001165

# Bonus: There is one bug below. Fix it, commit it, and give send me a pull
# request to fix it.

INPUT = 'jabberwocky.txt'

File.open(INPUT) do |input_file|

  input_file.each do |line|

    #{{{ 1. Split the file into words and print each on its own line.
    # Last time, we printed everything. This time, we'll split each line on
    # spaces and print out the words, one on each line.
    line.split.each do |word|
      puts word
    end
    #}}}

  end

end

# vim: set foldmethod=marker:
