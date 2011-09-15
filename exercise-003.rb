#!/usr/bin/env ruby

INPUT = 'jabberwocky.txt'

File.open(INPUT) do |f|

  # A Hash is a table mapping keys to values. Think of it like a dictionary.
  # If you know that word, you can look up information about it. (NB, neither
  # the word nor the value have to be strings; they can be anything.)
  #
  # Here, I create a new Hash object. I pass it 0. Now, if I try to access that
  # key that I haven't explicitly added to the Hash, it will return 0.  This
  # makes adding one to the count much easier.
  counts = Hash.new(0)


  f.each do |line|
    line.split.each do |word|
      # Last time, these were pretty strung out, and I used the destructive
      # versions (!) to show that they exist. Generally, you'll want to use the
      # non-desctructive versions, though. And here we can chain the calls
      # together nicely.
      #
      # If the word isn't currently in counts, remember that this just returns
      # 0.
      word = word.gsub(/\W/, '').downcase
      counts[word] = 1

    end

  end

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
end

