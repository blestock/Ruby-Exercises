#!/usr/bin/env ruby

INPUT = 'jabberwocky.txt'

# This has all been fun, but re-running this script everytime we want to look
# at the results would get old. Let's write it out to a file.
OUTPUT = 'jabberwocky-counts.txt'

File.open(INPUT) do |f|

  counts = Hash.new(0)

  f.each do |line|
    line.split.each do |word|
      word = word.gsub(/\W/, '').downcase
      counts[word] += 1 unless word.empty?
    end
  end

  count_array = counts.to_a
  count_array.sort_by! { |pair| pair[1] }
  count_array.reverse!

  # First, open the OUTPUT file for writing ('w'). Because we're already using
  # 'f' for the input file, we'll use 'fout'.
  File.open(OUTPUT, 'w') do |fout|
    count_array.each do |pair|
      key, value = pair

      # Now, instead of printing using puts, we write it to fout using the <<
      # method. Notice that we have to add '\n' to the end of the string so
      # everything we be on different lines.
      fout << "'#{key}'\t#{value}\n"

    end

    # Since we're not printing anything, there's no output. Really, that's
    # probably better, but it can make people nervous (what just happened?).
    # Let's make this more friendly.
    puts "All done. The output is in #{OUTPUT}."

  end
end

