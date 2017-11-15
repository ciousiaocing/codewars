=begin

What is an anagram? Well, two words are anagrams of each other if they both contain the same letters. For example:

'abba' & 'baab' == true

'abba' & 'bbaa' == true

'abba' & 'abbba' == false
Write a function that will find all the anagrams of a word from a list. You will be given two inputs a word and an array with words. You should return an array of all the anagrams or an empty array if there are none. For example:

anagrams(@"abba", @[@"aabb", @"abcd", @"bbaa", @"dada"]); // => @[@"aabb", @"bbaa"]
anagrams(@"racer", @[@"crazer", @"carer", @"racar", @"caers", @"racer"]); // => @[@"carer", @"racer"]
anagrams(@"laser", @[@"lazing", @"lazy", @"lacer"]); // => @[]

=end

# Best Solution
def anagrams(word, words)
  words.select { |w| w.chars.sort == word.chars.sort }
end

# select 挑選
arr = [1, 2, 3, 4, 5, 6]
arr.select { |a| a > 3 }     
=> [4, 5, 6]

# chars 字串轉成陣列
"hello".chars
=> ["h", "e", "l", "l", "o"]

# sort 排序
"adsc".chars.sort
=> ["a", "c", "d", "s"]

# join 陣列合成字串
"adsc".chars.sort.join
=> "acds"
