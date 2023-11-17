require 'spec_helper'

RSpec.describe Card do
  let (:card) { Card.new('What is the capital of Alaska?', 'Juneau', :Geography) }
  let (:card_2) { Card.new('Which planet is closest to the Sun?', 'Mercury', :STEM) }

  it 'exists' do
    expect(card).to be_instance_of(Card)
    expect(card_2).to be_instance_of(Card)
  end

  it 'has a question' do
    expect(card.question).to eq('What is the capital of Alaska?')
    expect(card_2.question).to eq('Which planet is closest to the Sun?')
  end

  it 'has an answer' do
    expect(card.answer).to eq('Juneau')
    expect(card_2.answer).to eq('Mercury')
  end

  it 'has a category' do
    expect(card.category).to eq(:Geography)
    expect(card_2.category).to eq(:STEM)
  end
end
