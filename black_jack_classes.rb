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
puts "dealer hand #{dealer.show_hand} #{dealer.find_score}"


begin
puts "Would you like to HIT or STAY ('h' or 's')"
player_action = gets.chomp
  player.hit(deck) if player_action == 'h'
  p player.show_hand
  puts player.find_score
end until player_action == 's'


# seven_spades = PlayingCard.new("7", "spades")
# four_diamonds = PlayingCard.new("4", "diamonds")
# king_hearts = PlayingCard.new('K', 'hearts')

# hand = [seven_spades, four_diamonds, king_hearts]

# hand.each do |card|
#   if card.face_card?
#     puts "Has a face card!"
#   else
#     puts "Nope...not a face card"
#   end
# end




# class Card
#   def initialize(rank= nil, suit = nil)
#     if suit.nil?
#       @suit = ['♠', '♣', '♥', '♦'].sample
#     else
#       @suit = suit
#     end

#     if rank.nil?
#       @rank = ['2', '3', '4', '5', '6', '7','8', '9', '10', 'J', 'Q', 'K', 'A',].sample
#     else
#       @rank = rank
#     end
#     puts "Create a new card: #{@rank} of #{@suit}"
#   end
# end

# 5.times { Card.new }
