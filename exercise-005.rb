#!/usr/bin/env ruby

INPUT = 'jabberwocky.txt'

File.open(INPUT) do |f|

  counts = Hash.new(0)

  f.each do |line|
    line.split.each do |word|
      word = word.gsub(/\W/, '').downcase
      counts[word] += 1 unless word.empty?
    end
  end

  # The output last time was great, but it would be better if it were sorted,
  # say from largest frequency to smallest. Hashes don't support sorting (they
  # store things randomly because it's faster), but arrays to.
  #
  # First, convert the hash to an array.
  count_array = counts.to_a

  # Right now, count_array looks like this: [['key', 1], ['key2', 1], ...].
  # When sorting, Ruby will compare each ['key', 1] pair. By default, this will
  # sort by the 'key' first, which we don't want. To specify that it should
  # sort by the value, we use sort_by! and pass in a block that returns the
  # second item.
  #
  # (See the '!' at the end of sort_by!, that means it sorts the array in
  # place, not returning a new one.)
  count_array.sort_by! { |pair| pair[1] }

  # We also want it to print in reverse order. We could have gotten that by
  # block we passed to sort_by! (take a moment to think of how we'd do this).
  # But instead, we're just going to explicitly reverse it.
  count_array.reverse!

  # Now that we're printing from count_array, the each method is a little
  # different.
  count_array.each do |pair|

    # This takes pair apart and assigns the first two items from it to key and
    # value.
    key, value = pair

    puts "'#{key}'\t#{value}"
  end
end

