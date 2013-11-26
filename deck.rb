require 'pry'
# require_relative 'playing_card'

class Deck
  def initialize
    @collection = []
    PlayingCard::SUITS.each do |suit|
      PlayingCard::VALUES.each do |value|
        @collection << PlayingCard.new(value, suit)
      end
    end
    @collection.shuffle!
  end

  def draw!
    @collection.pop
  end

  def collection
    @collection
  end
end