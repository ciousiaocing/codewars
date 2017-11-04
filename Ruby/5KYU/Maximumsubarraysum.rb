=begin

The maximum sum subarray problem consists in finding the maximum sum of a contiguous subsequence in an array or list of integers:

maxSequence [-2, 1, -3, 4, -1, 2, 1, -5, 4]
-- should be 6: [4, -1, 2, 1]
Easy case is when the list is made up of only positive numbers and the maximum sum is the sum of the whole array. If the list is made up of only negative numbers, return 0 instead.

Empty list is considered to have zero greatest sum. Note that the empty list or array is also a valid sublist/subarray.

=end




# Best Solution

def max_sequence(arr)
  (1..arr.size).flat_map { |window_size|
    arr.each_cons(window_size).map { |subarr|
      subarr.inject(:+)
    }
  }.max || 0
end



# Other Solution

def max_sequence(arr)
  max = 0

  # choose a starting point in the array
  (0..arr.length-1).each do |start|
    result = 0

    # loop forward through array elements
    (start..arr.length-1).each do |num|
      result += arr[num]
      max = result if result > max || start == 0
    end
  end

  return max
end

# flat_map
  [[1,2],[3,4]].flat_map {|i| i }   
  => [1, 2, 3, 4]

#inject
  [1,23,4].inject(:+)
  => 28
