require_relative 'playing_card'
require_relative 'player_hand'
require_relative 'dealer_hand'
require_relative 'deck'
require_relative 'point_calculation'

require 'pry'

puts "WELCOME TO BLACKJACK!"
puts
puts

deck = Deck.new

card_1 = deck.draw!
card_2 = deck.draw!
card_3 = deck.draw!
card_4 = deck.draw!

player  = Player.new([card_1, card_2])
puts "Your hand: #{player.show_hand.join(" ")}
Your score: #{player.find_score}"
puts
dealer = Dealer.new([card_3, card_4])
puts "Dealer's Hidden hand: #{dealer.hidden_hand.join(" ")}
Dealer's Hidden Score: #{dealer.hidden_score}"
# puts "dealer hand #{dealer.show_hand} #{dealer.find_score}"


# player action
begin
    puts "Would you like to HIT or STAY?('h' or 's')"
    player_action = gets.chomp.downcase
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
  puts "Dealer's Hidden Hand: #{dealer.hidden_hand}"
  puts "Dealer's Hidden Score: #{dealer.hidden_score}"
end until dealer.find_score > 17

sleep(2)
puts "The dealer flips over his hidden card..."
sleep(2)
puts "The Dealer had #{dealer.show_hand.join("  ")} with #{dealer.find_score} points."

if player.find_score >21
  puts "You busted! You lose!"
  exit
elsif dealer.find_score >21
  puts "The Dealer busted! You win!"
  exit
end

# tally up!
if player.find_score > dealer.find_score
  puts "You win with #{player.find_score} points!"
elsif player.find_score < dealer.find_score
  puts "The dealer won with #{dealer.find_score} points!"
end


