=begin

Move the first letter of each word to the end of it, then add 'ay' to the end
of the word.

pig_it('Pig latin is cool') # igPay atinlay siay oolcay

=end

# My Solution
def pig_it text
  text.split(" ").map {|x| x =~ /[a-zA-Z]/ ? x = x[1..x.length] + x[0] + "ay" : x}.join(" ")
end

# Better Solution
def pig_it text
  text.gsub(/(\w)(\w+)*/, '\2\1ay')
end

# * [正規表示式](https://guides.ruby.tw/ruby/regexp.html)

# "=~" 是匹配的運算子 (operator)，如果發現符合的話，就會在字串中傳回位置，沒有符合就會傳回 nil
ruby> "abcdef" =~ /d/
=> 3
ruby> "aaaaaa" =~ /d/
=> nil

#  \w	為一般字元 (word character)，即 [0-9A-Za-z_]
