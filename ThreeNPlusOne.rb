class ThreeNPlusOne
  attr_reader :maximum_cycle_length, :mcl_number, :min, :max
  def initialize min, max
    @min = min
    @max = max
    @maximum_cycle_length = get_cycle_length min
    @mcl_number = min
    max_cycle_length_between min, max
  end

  def get_cycle_length n
    cycle_length = 0
    loop do
      cycle_length+=1
      break if n == 1
      n = if n.odd?
        3*n + 1
      else
        n/2
      end
    end
    return cycle_length
  end

  def max_cycle_length_between min = @min, max = @max
    min.upto(max) do |n|
      if @maximum_cycle_length < get_cycle_length(n)
        @maximum_cycle_length = get_cycle_length(n)
        @mcl_number = n
      end
    end
  end

  def output
    "#{min} #{max} #{maximum_cycle_length}"
  end

end

puts ThreeNPlusOne.new(1,10).output
puts ThreeNPlusOne.new(100,200).output
puts ThreeNPlusOne.new(201,210).output
puts ThreeNPlusOne.new(900,1000).output





