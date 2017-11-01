=begin



=end

# My Solution
def longest_palindrome s
  result = 0
  0.upto(s.length-1) do |x|
    0.upto(s.length-x-1)do |y|
      if s[y..y+x] == s[y..y+x].reverse
          result = x + 1 if x + 1 > result
      end
    end
  end
  result
end

# Better Solution
def longest_palindrome s
  s.length.downto(1) do |n|
    s.chars.each_cons(n) do |arr|
      return n if arr == arr.reverse
    end
  end
  0
end

=begin

  #chars
    "aabbc".chars
    => ["a", "a", "b", "b", "c"]

  #each_cons
    (1..10).each_cons(3) {|a| p a}
    => [1, 2, 3]
    => [2, 3, 4]

=end
