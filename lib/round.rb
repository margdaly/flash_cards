# frozen_string_literal: true

# Round will be the object that processes responses and records guesses
class Round
  attr_reader :deck
  attr_accessor :turns

  # initialize will take a deck as an argument
  # and start with an empty array of turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards.first
  end
end
