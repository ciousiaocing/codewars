=begin

Your granny, who lives in town X0, has friends. These friends are given in an array, for example: array of friends is

[ "A1", "A2", "A3", "A4", "A5" ].
The order of friends is this array must not be changed since this order gives the order in which they will be visited.

These friends inhabit towns and you have an array with friends and towns, for example:

[ ["A1", "X1"], ["A2", "X2"], ["A3", "X3"], ["A4", "X4"] ]
or
(C)
{"A1", "X1", "A2", "X2", "A3", "X3", "A4", "X4"}
which means A1 is in town X1, A2 in town X2... It can happen that we don't know the town of one of the friends.

Your granny wants to visit her friends and to know how many miles she will have to travel.

You will make the circuit that permits her to visit her friends. For example here the circuit will contain:

X0, X1, X2, X3, X4, X0
and you must compute the total distance

X0X1 + X1X2 + .. + X4X0.
For the distance, fortunately, you have a map (and a hashmap) that gives each distance X0X1, X0X2 and so on. For example:

[ ["X1", 100.0], ["X2", 200.0], ["X3", 250.0], ["X4", 300.0] ]
or (Coffeescript, Javascript)
['X1',100.0, 'X2',200.0, 'X3',250.0, 'X4',300.0 ]
or
(C)
{"X1", "100.0", "X2", "200.0", "X3", "250.0", "X4", "300.0"}
which means that X1 is at 100.0 miles from X0, X2 at 200.0 miles from X0, etc...

More fortunately (it's not real life, it's a story...), the towns X0, X1, ..Xn are placed in the following manner:

X0X1X2 is a right triangle with the right angle in X1, X0X2X3 is a right triangle with the right angle in X2, etc...

If a town Xi is not visited you will suppose that the triangle

X0Xi-1Xi+1 is still a right triangle.

(Ref: https://en.wikipedia.org/wiki/Pythagoras#Pythagorean_theorem)

Task

Can you help your granny and give her the distance to travel?

Notes

If you have some difficulty to see the tour I made a non terrific but maybe useful drawing:

alternative text

Python Note

You must implement a function only, not a whole class.

All languages

The data type of the parameters can be seen in the examples test cases.

"tour" returns an int which is the floor of the total distance.

=end


# Best Solution
def tour(friends, fTowns, distTable)
  friend_towns = fTowns.to_h
  towns = friends.map { |friend| friend_towns[friend] }.compact
  dist_pairs = towns.map { |town| distTable[town] }.each_cons(2)
  sum = dist_pairs.map { |a, b| Math.sqrt((a**2 - b**2).abs) }.reduce(:+).floor
  distTable[towns.first] + sum + distTable[towns.last]
end

# Example

#1 friend_towns = fTowns.to_h 轉成Hash

fTowns = [["A1", "X1"], ["A2", "X2"], ["A3", "X3"], ["A4", "X4"]]
friends = ["A1", "A2", "A3", "A4", "A5"]
distTable = Hash["X1", 100.0, "X2", 200.0, "X3", 250.0, "X4", 300.0]

friend_towns = fTowns.to_h
{
    "A1" => "X1",
    "A2" => "X2",
    "A3" => "X3",
    "A4" => "X4"
}

#2 towns = friends.map { |friend| friend_towns[friend] }.compact
[
    [0] "X1",
    [1] "X2",
    [2] "X3",
    [3] "X4"
]
## compact 移除nil
[ "a", nil, "b", nil, "c", nil ].compact
#=> [ "a", "b", "c" ]

#3 dist_pairs = towns.map { |town| distTable[town] }.each_cons(2)
=> #<Enumerator: [100.0, 200.0, 250.0, 300.0]:each_cons(2)>
## each_cons 選取陣列
(1..10).each_cons(3) {|a| p a}
=>
[1, 2, 3]
[2, 3, 4]
[3, 4, 5]
[4, 5, 6]
[5, 6, 7]
[6, 7, 8]
[7, 8, 9]
[8, 9, 10]

#4 sum = dist_pairs.map { |a, b| Math.sqrt((a**2 - b**2).abs) }.reduce(:+).floor
=> 489
## sqrt(x) → Float 開平分根，值為浮點數
## abs絕對值
## floor 取整數


#5 distTable[towns.first] + sum + distTable[towns.last] 取總路徑
