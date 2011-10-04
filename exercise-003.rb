#!/usr/bin/env ruby

# For this exercise, we'll use a Hash to keep track of the frequency of each
# type of token (word).
#
# Documentation
# - For Hash.new: http://ruby-doc.org/core/classes/Hash.html#M000718
# - For Hash.[]=: http://ruby-doc.org/core/classes/Hash.html#M000729
# - For Hash.each: http://ruby-doc.org/core/classes/Hash.html#M000742

INPUT = 'jabberwocky.txt'

File.open(INPUT) do |input_file|

  #{{{ 1. First, use the Hash.new(obj) to create a Hash that returns 0 if the key isn't found. This makes tracking frequencies much easier.

  # A Hash is a table mapping keys to values. Think of it like a dictionary.
  # If you know that word, you can look up information about it. (NB, neither
  # the word nor the value have to be strings; they can be anything.)
  #
  # Here, I create a new Hash object. I pass it 0. Now, if I try to access that
  # key that I haven't explicitly added to the Hash, it will return 0.  This
  # makes adding one to the count much easier.
  counts = Hash.new(0)
  #}}}


  input_file.each do |line|
    line.split.each do |word|
      #{{{ 2. Compress the .gsub and .downcase lines to one line. Doing this will make your program more readable.

      # Last time, these were pretty strung out, and I used the destructive
      # versions (!) to show that they exist. Generally, you'll want to use the
      # non-desctructive versions, though. And here we can chain the calls
      # together nicely.
      #
      # If the word isn't currently in counts, remember that this just returns
      # 0.
      word = word.gsub(/\W/, '').downcase
      #}}}

      #{{{ 3. Now increment the frequency of word in the frequency hashtable.
      counts[word] += 1
      #}}}

    end

  end

  #{{{ 4. Now use Hash.each to get each key-value pair from counts and print them out.

  # Now that everything's counted, we can print it out. Remember each (we
  # called it above on files and the split lines. We can use that here too to
  # get each key, value pair.
  counts.each do |key, value|
    # This inserts the values of the variables into the string. Notice that I
    # used double quotes for this. It won't work with single quotes.
    #
    # The \t means to put a tab between the two.
    puts "'#{key}'\t#{value}"
  end
  #}}}
end

# vim: set foldmethod=marker:
