#!/usr/bin/env ruby
# encoding: UTF-8

#paul branch

require 'pry'

SUITS = ['♠', '♣', '♥', '♦']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

def build_deck
  deck = []

  SUITS.each do |suit|
    VALUES.each do |value|
      deck << PlayingCard.new(value, suit)
    end
  end
  deck.shuffle
end


def new_card(deck)
  deck.pop
end

def deal_hand(deck, player, dealer)
  dealer_card1 = deck.pop
  dealer_card2 = deck.pop
  player_card1 = deck.pop
  player_card2 = deck.pop
  dealer << dealer_card1
  dealer << dealer_card2
  player << player_card1
  player << player_card2
end

def hide_dealer(dealer)
  shown = ["X"]
  dealer.each_with_index do |card, index|
    next if index == 0
    shown.unshift(card)
  end
  shown
end

def ace_method(score, hand)
  hand.each do |card|
  if card.split('').first == "A"
    if score + 11 > 21
      score += 1
    else
      score += 11
    end
  end
end
  score
end

def sum(hand)
  score = 0
  hand.each do |card|
    if card.include?("X")
      score
    elsif card.include?("A")
      ace_method(score, hand)
      score
    elsif card.to_i == 0
      score += 10
    elsif
      score += card.to_i
    end
  end
  score
end

def hit(hand, deck)
  hand << new_card(deck)
end



deck = build_deck

dealer = []
player = []

#Player and dealer get their cards
deal_hand(deck, player, dealer)

puts "===== Welcome to Blackjack ====="
puts "player hand: #{player}: #{sum(player)}"
puts
puts "hidden dealer hand: #{hide_dealer(dealer)}: #{sum(hide_dealer(dealer))}"
puts
begin
puts "Would you like to HIT or STAY ('h' or 's')"
player_action = gets.chomp
 player_action == 'h'
  hit(player, deck)
end until player_action == 's'

puts  "player hand: #{player}: #{sum(player)}"
puts "dealer hand: #{dealer}: #{sum(dealer)}"
