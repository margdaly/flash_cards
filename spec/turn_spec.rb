require 'spec_helper'

describe Turn do
  let (:card_1) { Card.new('What is the capital of Alaska?', 'Juneau', :Geography) }
  let (:turn_w_win) { Turn.new('Juneau', card_1) }

  let (:card_2) { Card.new('Which planet is closest to the Sun?', 'Mercury', :STEM) }
  let (:turn_w_lose) { Turn.new('Mars', card_2) }

  it 'exists' do
    expect(turn_w_win).to be_instance_of(Turn)
    expect(turn_w_lose).to be_instance_of(Turn)
  end

  it 'has a guess' do
    expect(turn_w_win.guess).to eq('Juneau')
    expect(turn_w_lose.guess).to eq('Mars')
  end

  it 'has a card' do
    expect(turn_w_win.card).to eq(card_1)
    expect(turn_w_lose.card).to eq(card_2)
  end

  it 'can determine if the guess is correct' do
    expect(turn_w_win.correct?).to eq(true)
    expect(turn_w_lose.correct?).to eq(false)
  end

  it 'can give feedback' do
    expect(turn_w_win.feedback).to eq('Correct!')
    expect(turn_w_lose.feedback).to eq('Incorrect.')
  end
end