#!/usr/bin/env ruby

INPUT = 'jabberwocky.txt'

File.open(INPUT) do |input_file|

  counts = Hash.new(0)

  input_file.each do |line|
    line.split.each do |word|
      word = word.gsub(/\W/, '').downcase

      # Oops, did you notice this line in the output from last time?
      #
      #     ''	1
      #
      # Somehow, an empty token snuck in there. Probably, it was just some
      # punctuation standing by itself. Let's add a guard to the statement so
      # that it won't get added to the counts.
      counts[word] += 1 unless word.empty?
    end

  end

  counts.each do |key, value|
    puts "'#{key}'\t#{value}"
  end
end

