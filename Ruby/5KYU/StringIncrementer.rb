=begin

Your job is to write a function which increments a string, to create a new string. If the string already ends with a number, the number should be incremented by 1. If the string does not end with a number the number 1 should be appended to the new string.

Examples:

foo -> foo1

foobar23 -> foobar24

foo0042 -> foo0043

foo9 -> foo10

foo099 -> foo100

Attention: If the number has leading zeros the amount of digits should be considered.

=end

# Best Solution
def increment_string(input)
  input.sub(/\d*$/) { |n| n.empty? ? 1 : n.succ }
end

# [正規表達式](https://my.oschina.net/thinkgem/blog/713339)
# \d：數字   \D：非數字
# *：0 個或多個字符
# $：字尾

# succ
"abcd".succ        #=> "abce"
"THX1138".succ     #=> "THX1139"
"<<koala>>".succ   #=> "<<koalb>>"
"1999zzz".succ     #=> "2000aaa"
"ZZZ9999".succ     #=> "AAAA0000"
"***".succ         #=> "**+"

# sub只替换第一次匹配，gsub（g:global）会替换所有的匹配
str = "ABDADA"
new_str = str.sub(/A/, "*") 	#返回"*BDADA"
new_str2 = str.gsub(/A/, "*")	#返回"*BD*D*"
