=begin

Write simple .camelcase method for strings. All words must have their first
letter capitalized without spaces.

For instance:

'hello case'.camelcase => HelloCase
'camel case word'.camelcase => CamelCaseWord

=end

# My Solution
class String
  def camelcase
    self.split(" ").map {|x| x.capitalize}.join
  end
end

# Ciou my solution
class String
  def camelcase
    array = split(' ')
    array.map{ |i| i.to_s.capitalize }.join  # i 不需要在 i.to_s
  end
end
