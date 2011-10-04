#!/usr/bin/env ruby

# This time, we're going to use a regular expression to clean up the words.
# We'll remove everything that's not a letter or digit and lowercase it all.

# Regular expressions are a subject that we won't go into much detail on. The
# one we'll want to use below is very simple, though: /\W/

# Documentation:
# - For String.gsub!: http://ruby-doc.org/core/classes/String.html#M001193
# - For String.downcase!: http://ruby-doc.org/core/classes/String.html#M001160

# Bonus: There is one bug below. Fix it, commit it, and give send me a pull
# request to fix it.

INPUT = 'jabberwocky.txt'

File.open(INPUT) do |input_file|

  input_file.each do |line|

    line.split.each do |word|

      #{{{ 1. First, use a regular expressionremove all the non-alphanumeric characters. Remember that the regular expression is just /\W/.

      # We'll do this using a very simple regular expression. \w matches
      # anything that's a word. The definition of *word* here includes an
      # underscore, but we won't worry about that. \W matches anything that's
      # *not* a word.
      #
      # word.gsub removes replaces everything that matches the regular
      # expression (regex) with the argument in the second string (here an
      # empty string), and it returns that new string.
      #
      # word.gsub! goes a step further and changes word in place.
      word = word.gsub(/\W/, '')
      #}}}

      #{{{ 2. Now make the word lower-case.
      # word.downcase makes everything lowercase and returns a new string.
      # word.downcase! makes everything lowercase in word.
      word = word.downcase
      #}}}

      # This process -- taking a word removing all the superfluous fluff from
      # it so that we can process it more efficiently, is called
      # *normalization*. It's kind of it's own thing, it's own discrete step.
      # In a few steps, we'll think about how to make our program reflect that.

      puts word

    end
  end
end

# vim: set foldmethod=marker:
