#!/usr/bin/env ruby

# Everything's working fine, but it could be clearer. Right now if we have to
# change anything, it will just be messier and messier. Also, have have some
# nice code, and it might be nice to use it other places. Let's first pull
# everything out into different functions.
#
# We'll want a function to read the file and tokenize it. Normalization is
# another good function. Sorting the output is a logical entity, too, so we'll
# pull that into a new function. And finally, writing the output is another
# function.
#
# At the end, we'll call the functions to generate the same results.
#
# Note that when we separate the code into functions (we call this process
# *refactoring*), we don't use the constants INPUT and OUTPUT. it's easier to
# re-use the functions if we pass in the files.

INPUT = 'jabberwocky.txt'
OUTPUT = 'jabberwocky-counts.txt'

# This function takes a filename and returns a list of tokens.
def read_tokens(filename)

  # Since we're returning the tokens as an array, we need to create that array
  # here.
  tokens = []

  File.open(filename) do |input_file|
    input_file.each do |line|
      line.split.each do |word|
        word = normalize(word)
        tokens << word unless word.empty?
      end
    end
  end

  # Since it's the last line in the file, this function will return the array.
  tokens
end

# This takes a token and normalizes it.
def normalize(token)
  token.gsub(/\W/, '').downcase
end

# This takes an array of tokens and returns a Hash with the tokens'
# frequencies.
def count_tokens(tokens)
  counts = Hash.new(0)
  tokens.each do |token|
    counts[token] += 1
  end
  counts
end

# This converts the frequency Hash into a sorted array.
def sort_counts(counts)
  count_array = counts.to_a
  count_array.sort_by! { |pair| pair[1] }
  count_array.reverse!
  count_array
end

# Finally, this will write the sorted array of frequencies to a file.
def write_counts(output, counts)
  File.open(output, 'w') do |output_file|
    counts.each do |pair|
      key, value = pair
      output_file << "#{key}\t#{value}\n"
    end
  end
end


# Now we string everything together to get the work done.
tokens = read_tokens(INPUT)
counts = count_tokens(tokens)
sorted = sort_counts(counts)
write_counts(OUTPUT, sorted)

puts "All done. The output is in #{OUTPUT}."

# Notice how much clearer it is, too. We have a high-level overview of the
# entire process, and we can dig into details only when we want to.

