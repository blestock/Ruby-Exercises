#!/usr/bin/env ruby

# This opens jabberwocky.txt, reads each line, and breaks it into words, which
# it prints to the screen.

# First, set the name of the file to the constant INPUT. This makes it easy to
# change the name later.
INPUT = 'jabberwocky.txt'

# Now, open the file. This executes the block (do |f| ... end), with 'f'
# assigned to the File object. When the block is done, the file is
# automatically closed.
File.open(INPUT) do |f|

  # This executes the block (do |line| ... end) for every line in the file.
  f.each do |line|

    # Last time, we printed everything. This time, we'll split each line on
    # spaces and print out the words, one on each line.
    line.split.each do |word|
      puts word
    end

  end

end


