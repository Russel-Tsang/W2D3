
def remove_dups(arr)
  new_arr = []
  arr.each do |el|
    new_arr << el unless new_arr.include?(el)
  end
  new_arr
end

class Array
  def two_sum
    pairs = []
    (0...self.length).each do |i|
      (i + 1...self.length).each do |j|
        pairs << [i, j] if self[i] + self[j] == 0
      end
    end
    pairs
  end
end

def my_transpose(arr)
  output = []
  (0...arr.length).each do |i|
    sub_arr = []
    (0...arr.length).each do |j|
      sub_arr << arr[j][i]
    end
    output << sub_arr
  end
  output
end

def stock_picker(stocks)
  best_buy = stocks.min
  best_sell = stocks.max
  [stocks.index(best_buy), stocks.index(best_sell)]
end

class Tower_of_hanoi
  attr_reader :rods
  def initialize
    @rods = [[3,2,1], [4,5,6], [8,9,7]]
  end

  def moves(move)
    raise BigDiskError if self.rods[move[0]].last > self.rods[move[1]].last
    self.rods[move[1]] << self.rods[move[0]].pop
  end
end

tower = Tower_of_hanoi.new
tower.moves([0,1])

class BigDiskError < StandardError

end