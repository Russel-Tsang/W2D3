class Deck
  CARD_VALUES = [
    2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K, :A
  ]
  SUITS = [ :diamonds, :hearts, :clubs, :spades ]

  attr_reader :deck
  def initialize
    @deck = populate.shuffle
  end

  def populate
    deck = []
    CARD_VALUES.each do |value|
      SUITS.each do |suit|
        deck << Card.new(value, suit)
      end
    end
    deck
  end

  def draw_card
    self.deck.pop
  end

  def add_card(card)
    self.deck.unshift(card)
  end
end