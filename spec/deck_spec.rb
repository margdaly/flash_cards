require 'spec_helper'

describe Deck do
  let (:card_1) { Card.new('What is the chemical symbol for gold?', 'Au', :STEM) }
  let (:card_2) { Card.new('What is the capital of Colorado?', 'Denver', :Geography) }
  let (:card_3) { Card.new('What does "URL" stand for in the context of web addresses?', 'Uniform Resource Locator', :STEM) }
  let (:cards) { [card_1, card_2, card_3] }
  let (:deck) { Deck.new(cards) }

  it 'exists' do
    expect(deck).to be_instance_of(Deck)
  end

  it 'has cards' do
    expect(deck.cards).to eq(cards)
  end

  it 'returns a count of cards' do
    expect(deck.count).to eq(3)
  end

  it 'returns cards for a given category' do
    expect(deck.cards_in_category(:STEM)).to eq([card_1, card_3])
    expect(deck.cards_in_category(:Geography)).to eq([card_2])
    expect(deck.cards_in_category(:History)).to eq([])
  end
end
