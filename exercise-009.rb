#!/usr/bin/env ruby

# We want to use keep track of the unique tokens.
require 'set.rb'


INPUT = 'jabberwocky.txt'
OUTPUT = 'jabberwocky-counts.txt'


# This class handles the text analysis process that we're defining here.
class TextProcessor

  attr_reader = [:filename, :tokens, :counts, :count_array]

  # When someone creates an instance of this object, they'll pass the file name
  # in then.
  def initialize(filename)
    @filename = filename
  end

  # This function tokenizes the file and returns a list of tokens.
  def read_tokens
    @tokens = []

    File.open(@filename) do |input_file|
      input_file.each do |line|
        line.split.each do |word|
          word = normalize(word)
          @tokens << word unless word.empty?
        end
      end
    end

    @tokens
  end

  # This takes a token and normalizes it.
  def normalize(token)
    token.gsub(/\W/, '').downcase
  end

  # This creates a Hash of the tokens' frequencies.
  def count_tokens
    @counts = Hash.new(0)
    @tokens.each do |token|
      @counts[token] += 1
    end
    @counts
  end

  # This converts the frequency Hash into a sorted array.
  def sort_counts
    @count_array = @counts.to_a
    @count_array.sort_by! { |pair| pair[1] }
    @count_array.reverse!
    @count_array
  end

  # This will write the sorted array of frequencies to a file.
  def write_counts(output)
    File.open(output, 'w') do |output_file|
      @count_array.each do |pair|
        key, value = pair
        output_file << "#{key}\t#{value}\n"
      end
    end
  end

  # Finally, this method handles the entire process.
  def process(output)
    read_tokens
    count_tokens
    sort_counts
    write_counts(output)
  end

  # This also computes the type/token ratio. This is a measure of the
  # vocabulary used in the text. This isn't included in the default processing,
  # but it can be output afterward.
  def type_token_ratio

    # First, we get the unique tokens by creating a set out of the list.
    types = Set.new(@tokens)

    # Now, we get the ratio.
    types.size / @tokens.size

  end

end


# Now we string everything together to get the work done.
processor = TextProcessor.new(INPUT)
processor.process(OUTPUT)

# We can write the type/token ratio to the file by opening it to append.
File.open(OUTPUT, 'a') do |output_file|
  output_file << "Type/token ratio: #{processor.type_token_ratio}\n"
end
puts "All done. The output is in #{OUTPUT}."

