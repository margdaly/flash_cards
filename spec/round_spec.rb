require 'spec_helper'

describe Round do
  let (:card_1) { Card.new('What does the acronym "HTML" stand for in web development?', 'HyperText Markup Language', :STEM) }
  let (:card_2) { Card.new('In computer programming, what does the term "API" stand for?', 'Application Programming Interface', :STEM) }
  let (:card_3) { Card.new('On which continent are polar bears exclusively found?', 'Antarctica', :Geography) }
  let (:deck) { Deck.new([card_1, card_2, card_3]) }
  let (:round) { Round.new(deck) }

  describe 'starting a round' do
    it 'exists' do
      expect(round).to be_instance_of(Round)
    end

    it 'starts with a deck' do
      expect(round.deck).to eq(deck)
      expect(round.deck).to be_instance_of(Deck)
    end

    it 'starts with an empty array of turns' do
      expect(round.turns).to be_empty
      expect(round.turns).to be_instance_of(Array)
    end

    it 'returns the first card in the deck as the current card' do
      expect(round.current_card).to eq(card_1)
      expect(round.current_card).to be_instance_of(Card)
      expect(round.current_card).to eq(deck.first)
    end
  end

  describe 'taking turns' do
    
  end
end
