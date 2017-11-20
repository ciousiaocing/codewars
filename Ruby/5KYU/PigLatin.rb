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

# Better Solution解析
=begin
gsub()執行字符串替換。
正則表達式搜索單個字母 \w，括號使它成為一個捕獲組，所以（\w）捕獲存儲在文本中的字符串的第一個字母。
（\w +）然後捕獲字符串中其餘的字母。
第二個參數是用什麼來替換找到的事件。在這種情況下， \2 代表上面的第二個捕獲組，而 \1 代表第一個捕獲組。
因此，對於字符串“hello”， \2 將是“ello”， \1 將是“h”。替換的結果是“ellohay”


'*' :	前一符號的內容出現 0 或數次。當字串只有一個字母時的情況
You should 'pig' "O tempora o mores !" 
- Expected: "Oay emporatay oay oresmay !", 
instead got: "O emporatay o oresmay !"

=end

# * [正規表示式](https://guides.ruby.tw/ruby/regexp.html)

# "=~" 是匹配的運算子 (operator)，如果發現符合的話，就會在字串中傳回位置，沒有符合就會傳回 nil
ruby> "abcdef" =~ /d/
=> 3
ruby> "aaaaaa" =~ /d/
=> nil

#  \w	為一般字元 (word character)，即 [0-9A-Za-z_]

# gsub
"hello".gsub(/[aeiou]/, '*')                  #=> "h*ll*"
"hello".gsub(/([aeiou])/, '<\1>')             #=> "h<e>ll<o>"
"hello".gsub(/./) {|s| s.ord.to_s + ' '}      #=> "104 101 108 108 111 "
"hello".gsub(/(?<foo>[aeiou])/, '{\k<foo>}')  #=> "h{e}ll{o}"
'hello'.gsub(/[eo]/, 'e' => 3, 'o' => '*')    #=> "h3ll*"
