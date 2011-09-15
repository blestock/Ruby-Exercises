#!/usr/bin/env ruby

INPUT = 'jabberwocky.txt'

File.open(INPUT) do |input_file|

  input_file.each do |line|

    # Last time, we printed everything. This time, we'll split each line on
    # spaces and print out the words, one on each line.
    line.split do |word|
      puts word
    end

  end

end


