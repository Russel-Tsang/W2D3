require "first_tdd"
require "rspec"

describe "#remove_dups" do
  it "removes array duplicates" do 
    arr = [1,2,2,2,3,4]
    expect(remove_dups(arr)).to eq([1,2,3,4])
    remove_dups(arr)
  end
end

describe "#two_sum" do
  it "finds position indices whose values sum to 0" do
    arr = [-1, 0, 2, -2, 1]
    expect(arr.two_sum).to eq([[0,4], [2,3]])
  end
end

describe "#my_transpose" do 
  it "transposes an array" do 
    rows = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]
    expect(my_transpose(rows)).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
  end
end

describe '#stock_picker' do
  it 'it finds the most profitable days to buy and sell stock' do
    stock = [0,1,2,3,4,5,6]
    expect(stock_picker(stock)).to eq([0, 6])
  end
end

describe "towers_of_hanoi" do
  subject(:towers) { Tower_of_hanoi.new }
  describe "#moves" do
    it "checks to see if the disks are being moved one at a time and places it" do 
      towers.moves([0, 1])
      expect(towers.rods[0].length).to eq(2)
      expect(towers.rods[1].length).to eq(4)      
    end

    it "ensures that a bigger disc will not be placed on top of a smaller disc" do
      expect{ towers.moves([1, 0]) }.to raise_error(BigDiskError)
    end
  end

  describe "#won" do 
    context "when the game hasnt been won" do 
      
      it "returns false" do 
        expect(won)
      end
    end
  end
end