require 'spec_helper'

describe Round do
  let (:card_1) { Card.new('What does the acronym "HTML" stand for in web development?', 'HyperText Markup Language', :STEM) }
  let (:card_2) { Card.new('In computer programming, what does the term "API" stand for?', 'Application Programming Interface', :STEM) }
  let (:card_3) { Card.new('On which continent are kangaroos exclusively found?', 'Australia', :Geography) }
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
    end
  end

  describe 'taking turns' do
    before :each do
      @new_turn = round.take_turn('HyperText Markup Language')
    end
    
    it 'records a guess and creates a new turn' do
      expect(@new_turn).to be_instance_of(Turn)
      expect(@new_turn.guess).to eq('HyperText Markup Language')
      expect(@new_turn.card).to eq(card_1)
      expect(round.turns).to eq([@new_turn])
    end

    it 'records if the turn was correct' do
      expect(@new_turn.correct?).to be(true)
      expect(round.number_correct).to eq(1)
    end

    it 'returns feedback for the turn' do
      expect(round.last_turn_feedback).to eq('Correct!')
    end

    it 'returns the next card in the deck as the current card' do
      expect(round.current_card).to eq(card_2)
    end
  end

  describe 'taking multiple turns' do
    before :each do
      round.take_turn('HyperText Markup Language')
      round.take_turn('Application Programming Interface')
      round.take_turn('Africa')
    end

    it 'records the number of correct guesses' do
      expect(round.number_correct).to eq(2)
    end

    it 'records the number of correct guesses by category' do
      expect(round.number_correct_by_category(:STEM)).to eq(2)
      expect(round.number_correct_by_category(:Geography)).to eq(0)
    end

    it 'returns the percent of correct guesses' do
      expect(round.percent_correct).to eq(66.7)
    end

    it 'returns the percent of correct guesses by category' do
      expect(round.percent_correct_by_category(:STEM)).to eq(100.0)
      expect(round.percent_correct_by_category(:Geography)).to eq(0.0)
    end
  end
end
