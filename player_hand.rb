class Player
  attr_accessor :hand

  def initialize(hand)
    @hand = hand
  end

  def find_score
    score = 0
    @hand.each do |card|
      score += PointCalculation.new(card).value
      end
      @hand.each do |card|
        if card.ace? && score + 10 < 22
          score += 10
        end
    end
    score
  end

  def hit(deck)
    @hand << deck.draw!
  end

  def show_hand
    shown_hand = []
    @hand.each do |card|
      shown_hand << card.rank + card.suit
    end
    shown_hand
  end
end