class PointCalculation
  def intialize(playing_card)
    @playing_card =  playing_card
  end

  def value
    if @playing_card.face_card?
      15
    elsif @playing_card.rank == "A"
      1
    else
     @playing_card.rank.to_i
    end
  end
end