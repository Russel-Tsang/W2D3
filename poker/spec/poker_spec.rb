require "rspec"
require "card"
require "deck"
require "hand"

describe "Card" do 
  subject(:card) {Card.new("Jack", "Hearts")}
  describe "#initialize" do 
    it "sets a card value" do 
      expect(card.value).to eq("Jack")
    end
    it "set's the cards suit" do 
      expect(card.suit).to eq("Hearts")
    end
  end
end

describe "Deck" do
  subject(:deck) { Deck.new }
  describe "#initialize" do 
    it "sets an array of 52 card objects" do 
      expect(deck.deck.all? { |card| card.is_a?(Card)}).to be(true)
    end
    context "creates the right amount of each card" do
      it "creates the right amount of each suit" do 
        suits = Hash.new(0)
        deck.deck.each do |card|
          suits[card.suit] += 1
        end
        correct_suits = {:clubs=>13, :spades=>13, :hearts=>13, :diamonds=>13}
        expect(suits).to eq(correct_suits)
      end
      it "creates the right amount of each value" do 
        values = Hash.new(0)
        deck.deck.each do |card|
          values[card.value] += 1
        end
        correct_values = { 2 => 4, 3 => 4, 4 => 4, 5 => 4, 6 => 4, 7 => 4, 8 => 4, 9 => 4, 10 => 4, J: 4, Q: 4, K: 4, A: 4}
        expect(values).to eq(correct_values)
      end
    end
    
  end

  describe "#draw_card" do 
    it "returns a card from the top of the deck" do
      expect(deck.draw_card.class).to be(Card)
    end
    it "subtracts the card from the deck" do 
      deck.draw_card
      expect(deck.deck.length).to eq(51)
    end
  end

  describe "#add_card" do
    it "should add a card to the bottom of the deck" do
      added_card = Card.new(:J, :hearts)
      deck.add_card(added_card)
      expect(deck.deck.first).to eq(added_card)
    end
  end
end

describe "Hand" do 
  let(:deck) { double("deck")}
  subject(:test_hand) { Hand.new(deck)}
  describe "#initialize" do 
    it "creates a hand with 5 cards in it" do 
      allow(deck).to receive(:draw_card)
      expect(test_hand.hand.length).to eq(5)
    end
  end
end