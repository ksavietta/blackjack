#!/usr/bin/env ruby
# encoding: UTF-8

SUITS = ['♠', '♣', '♥', '♦']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

def build_deck
  deck = []

  SUITS.each do |suit|
    VALUES.each do |value|
      deck.push(value + suit)
    end
  end
  deck.shuffle
end


def new_card(deck)
  deck.pop
end

def deal_hand(deck, p_hand, d_hand)
  dealer_card1 = deck.pop
  dealer_card2 = deck.pop
  player_card1 = deck.pop
  player_card2 = deck.pop
  d_hand << dealer_card1
  d_hand << dealer_card2
  p_hand << player_card1
  p_hand << player_card2
end

def hide_d_hand(d_hand)
  shown = ["X"]
  d_hand.each_with_index do |card, index|
    next if index == 0
    shown.unshift(card)
  end
  shown
end

def ace_method(score, hand, index)
  hand.each_with_index do |card, hand_index|
    next if index == hand_index
    if card.include?("A")
      ace_method
    end
  end
  if (11 + score) > 21
    score -= 10
  else
    score += 11
  end
end

def sum(hand)
  score = 0
  hand.each_with_index do |card, index|
    if card.include?("X")
      score
    elsif card.include?("A")
      score += ace_method(score, hand, index)
    elsif card.to_i == 0
      score += 10
    else
      score += card.to_i
    end
  end
  score
end

deck = build_deck

d_hand = []
p_hand = []

#Player and dealer get their cards
deal_hand(deck, p_hand, d_hand)

p_score = 0
d_score = 0

puts "player hand: #{p_hand}: #{sum(p_hand)}"
puts "dealer hand: #{d_hand}: #{sum(d_hand)}"
puts "hidden dealer hand: #{hide_d_hand(d_hand)}: #{sum(hide_d_hand(d_hand))}"
puts
puts

d_hand << new_card(deck)



puts "player hand: #{p_hand}: #{sum(p_hand)}"
puts "dealer hand: #{d_hand}: #{sum(d_hand)}"
puts "hidden dealer hand: #{hide_d_hand(d_hand)}: #{sum(hide_d_hand(d_hand))}"
puts