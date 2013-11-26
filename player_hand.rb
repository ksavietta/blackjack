class PlayerHand
  def initialize(collection)
    @collection = collection
  end

  def score
    score = 0
    @collection.each do |card|
      puts card.rank
      score += PointCalculation.new(card).value
    end
    score
  end
end