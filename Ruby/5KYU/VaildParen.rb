=begin

Write a function called validParentheses that takes a string
of parentheses, and determines if the order of the parentheses
is valid. validParentheses should return true if the string is valid,
and false if it's invalid.

Examples:
validParentheses( "()" ) => returns true
validParentheses( ")(()))" ) => returns false
validParentheses( "(" ) => returns false
validParentheses( "(())((()())())" ) => returns true

All input strings will be nonempty, and will only consist of
open parentheses '(' and/or closed parentheses ')'

=end

# My solution
def valid_parentheses(string)
  parentheses = 0
  string.split("").each do |x|
    return false if x == ")" && parentheses == 0
    parentheses += 1 if x == "("
    parentheses -= 1 if x == ")"
  end
  parentheses == 0 ? true : false
end

# Another Solution
def valid_parentheses(string)
 str = string.delete("^()")
 while str.gsub!("()",''); end
 str == ''
end

# delete刪除 ＆ delete("^t")刪除除了t以為的字元
"())()test".delete("^()") 
=> "())()"

# split("") & chars 效果一樣
"()()())".split("")
=> [
    [0] "(",
    [1] ")",
    [2] "(",
    [3] ")",
    [4] "(",
    [5] ")",
    [6] ")"
 ]

"()()())".chars
=> [
    [0] "(",
    [1] ")",
    [2] "(",
    [3] ")",
    [4] "(",
    [5] ")",
    [6] ")"
]
