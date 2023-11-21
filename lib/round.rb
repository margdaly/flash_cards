# frozen_string_literal: true

# Round will be the object that processes responses and records guesses
class Round
  attr_accessor :deck, :turns

  # initialize will take a deck as an argument
  # and start with an empty array of turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    if @deck.cards != []
      @deck.cards.first
    else 
      "No more cards"
    end
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    @deck.cards.shift
    turn
  end

  def number_correct
    @turns.count(&:correct?)
  end

  def number_correct_by_category(category)
    @turns.count { |turn| turn.correct? && turn.card.category == category }
  end

  def last_turn_feedback
    @turns.last.feedback
  end

  def percent_correct
    (number_correct.to_f / @turns.count * 100).round(1)
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category).to_f / @turns.count { |turn| turn.card.category == category } * 100).round(1)
  end
end
