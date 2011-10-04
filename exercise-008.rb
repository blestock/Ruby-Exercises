#!/usr/bin/env ruby

# That's helped a lot, but changing parts of the process could be difficult.
# How would you go about changing normalization?
#
# Ruby handles this by putting things into classes. Here, we'll create a class
# to handle the input/tokenization/frequency/output process. Once that's done,
# we can change any part easily by subclassing this class and just redefining
# that method. (Don't worry about the details of this. Just take my word, it's
# easy.)

INPUT = 'jabberwocky.txt'
OUTPUT = 'jabberwocky-counts.txt'


# This class handles the text analysis process that we're defining here.
class TextProcessor

  # We're going to save some of the stuff to the instance. Here are accessors,
  # which allow other parts of the program to access that data later. We could
  # define these to be writable too, but right now, we'll just let people look
  # at them without changing them.
  attr_reader = [:filename, :tokens, :counts, :count_array]

  # When someone creates an instance of this object, they'll pass the file name
  # in then.
  def initialize(filename)
    @filename = filename
  end

  # This function tokenizes the file and returns a list of tokens.
  def read_tokens()

    # By adding @ to tokens, we're saving it also in the instance. We're not
    # going to use that, but it might be useful later.
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
  def count_tokens()
    @counts = Hash.new(0)
    @tokens.each do |token|
      @counts[token] += 1
    end
    @counts
  end

  # This converts the frequency Hash into a sorted array.
  def sort_counts()
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

  # Finally, we provide a method that handles the entire process. Notice that
  # there are now two ways to use this class. First, if you just want the
  # default processing, you can instantiate the class that call the process
  # method. Or, if you want more control, you can call the method for each step
  # of the process explicitly, maybe changing parts.
  def process(output)
    read_tokens
    count_tokens
    sort_counts
    write_counts(output)
  end

end



# Now we string everything together to get the work done.
processor = TextProcessor.new(INPUT)
processor.process(OUTPUT)

puts "All done. The output is in #{OUTPUT}."

