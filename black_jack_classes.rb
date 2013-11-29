require_relative 'playing_card'
require_relative 'player_hand'
require_relative 'dealer_hand'
require_relative 'deck'
require_relative 'point_calculation'

require 'pry'

deck = Deck.new

card_1 = deck.draw!
card_2 = deck.draw!
card_3 = deck.draw!
card_4 = deck.draw!

player  = Player.new([card_1, card_2])
puts "player hand #{player.show_hand} #{player.find_score}"
dealer = Dealer.new([card_3, card_4])
puts "dealer hand #{dealer.hidden_hand} #{dealer.hidden_score}"
# puts "dealer hand #{dealer.show_hand} #{dealer.find_score}"


# player action
begin
    puts "Would you like to HIT or STAY ('h' or 's')"
    player_action = gets.chomp
      player.hit(deck) if player_action == 'h'
      p player.show_hand
      puts player.find_score
end until player_action == 's' || player.find_score > 21

if player.find_score > 21
  puts "You bust!"
  exit
end

# dealer action
begin
  dealer.hit(deck)
  puts "Dealer Hidden Hand: #{dealer.hidden_hand}"
  puts "Dealer Hidden Score: #{dealer.hidden_score}"
end until dealer.find_score > 17

puts "the dealer flips over his hidden card..."
sleep(5)
puts "Dealer had #{dealer.show_hand} with #{dealer.find_score} points."

if player.find_score >21
  puts "You busted! You lose!"
  exit
elsif dealer.find_score >21
  puts "The Dealer busted! You win!"
  exit
end

# tally up!
if player.find_score > dealer.find_score
  puts "You win!"
elsif player.find_score < dealer.find_score
  puts "The dealer won!"
end


