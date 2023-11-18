# frozen_string_literal: true

# Round will be the object that processes responses and records guesses
class Round
  attr_reader :deck

  # initialize will take a deck as an argument
  def initialize(deck)
    @deck = deck
  end
end
