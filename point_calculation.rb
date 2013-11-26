class PointCalculation

  def initialize(playing_card)
    @playing_card =  playing_card
  end

  def value
    if @playing_card.face_card?
      10
    elsif @playing_card.ace?
      1
    else
     @playing_card.rank.to_i
    end
  end

  # hand.each do |card|
  # if card.split('').first == "A"
  #   if score + 11 > 21
  #     score += 1
  #   else
  #     score += 11
  #   end
  # end

  # score





end