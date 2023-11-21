require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new('What is the chemical symbol for gold?', 'Au', :STEM)
card_2 = Card.new('What is the capital of Colorado?', 'Denver', :Geography)
card_3 = Card.new('What does "URL" stand for in the context of web addresses?', 'Uniform Resource Locator', :STEM)
deck = Deck.new([card_1, card_2, card_3])
total_cards = deck.count
round = Round.new(deck)

puts "\nWelcome to Flash Cards!\n You're playing with #{total_cards} cards.\n"
puts "----------------------------\n"

puts "This is card number #{round.turns.count + 1} out of #{deck.count}."
puts "Question: #{round.current_card.question}\n"
guess = gets.chomp
round.take_turn(guess)
puts "#{round.last_turn_feedback}\n\n"

puts "This is card number #{round.turns.count + 1} out of #{total_cards}."
puts "Question: #{round.current_card.question}\n"
guess = gets.chomp
round.take_turn(guess)
puts "#{round.last_turn_feedback}\n"

