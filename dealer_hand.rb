class Dealer
  attr_accessor :hand

  def initialize(hand)
    @hand = hand

  end

  def find_score
    score = 0
    @hand.each do |card|
      score += PointCalculation.new(card).value
    end
    score
  end

  def hit(deck)
    @hand << deck.draw!
  end

  def hidden_hand
    shown_hand = ["X"]
    @hand.each_with_index do |card, index|
      next if index == 0
      shown_hand.unshift(card.rank + card.suit)
    end
    shown_hand
  end

  def hidden_score
    score = 0
    @hand.each do |card|
      score += PointCalculation.new(card).value
    end
    first = PointCalculation.new(@hand[0]).value
    score - first
  end

  def show_hand
    shown_hand = []
    @hand.each do |card|
      shown_hand << card.rank + card.suit
    end
  shown_hand
  end

end