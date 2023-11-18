require 'spec_helper'

describe Round do
  let (:card_1) { Card.new('What does the acronym "HTML" stand for in web development?', 'HyperText Markup Language', :STEM) }
  let (:card_2) { Card.new('In computer programming, what does the term "API" stand for?', 'Application Programming Interface', :STEM) }
  let (:card_3) { Card.new('On which continent are polar bears exclusively found?', 'Antarctica', :Geography) }
  let (:deck) { Deck.new([card_1, card_2, card_3]) }
  let (:round) { Round.new(deck) }

  describe '#initialize' do
    it 'exists' do
      expect(round).to be_instance_of(Round)
    end

    it 'is initialized with a deck' do
      expect(round.deck).to eq(deck)
    end

    it 'starts with an empty array of turns' do
      expect(round.turns).to be_empty
    end
  end
end