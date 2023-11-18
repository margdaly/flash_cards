# frozen_string_literal: true

# Round will be the object that processes responses and records guesses
class Round
  attr_reader :deck
  attr_accessor :turns

  # initialize will take a deck as an argument
  def initialize(deck)
    @deck = deck
    @turns = []
  end
end
