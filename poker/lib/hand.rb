require_relative "card"
require_relative "deck"

class Hand
  attr_reader :hand
  def initialize(deck)
    @deck = deck
    @hand = start_cards
  end

  def start_cards
    hand = []
    5.times { hand << self.deck.draw_card }
    handa
  end
end

