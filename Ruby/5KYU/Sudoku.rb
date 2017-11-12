=begin

Write a function done_or_not/DoneOrNot passing a board (list[list_lines]) as parameter. If the board is valid return 'Finished!', otherwise return 'Try again!'

Sudoku rules:

Complete the Sudoku puzzle so that each and every row, column, and region contains the numbers one through nine only once.

Rows:



There are 9 rows in a traditional Sudoku puzzle. Every row must contain the numbers 1, 2, 3, 4, 5, 6, 7, 8, and 9. There may not be any duplicate numbers in any row. In other words, there can not be any rows that are identical.

In the illustration the numbers 5, 3, 1, and 2 are the "givens". They can not be changed. The remaining numbers in black are the numbers that you fill in to complete the row.

Columns:



There are 9 columns in a traditional Sudoku puzzle. Like the Sudoku rule for rows, every column must also contain the numbers 1, 2, 3, 4, 5, 6, 7, 8, and 9. Again, there may not be any duplicate numbers in any column. Each column will be unique as a result.

In the illustration the numbers 7, 2, and 6 are the "givens". They can not be changed. You fill in the remaining numbers as shown in black to complete the column.

Regions



A region is a 3x3 box like the one shown to the left. There are 9 regions in a traditional Sudoku puzzle.

Like the Sudoku requirements for rows and columns, every region must also contain the numbers 1, 2, 3, 4, 5, 6, 7, 8, and 9. Duplicate numbers are not permitted in any region. Each region will differ from the other regions.

In the illustration the numbers 1, 2, and 8 are the "givens". They can not be changed. Fill in the remaining numbers as shown in black to complete the region.

Valid board example:


=end

# Solution 1
def done_or_not(board) #board[i][j]
    check_rows(board) && check_regions(board) && check_cols(board)? "Finished!":"Try again!"    
end 

def check_regions(board)
    slices = board.each_slice(3).to_a
    regions = slices.map {|s| s.transpose.reduce(:+).each_slice(9).to_a}.reduce(:+)
    regions.map{|e| check_sum(e)}.reduce(:&)
end

def check_rows(board)
    board.map {|e| check_sum(e)}.reduce(:&)
end

def check_cols(board)
    board.transpose.map {|e| check_sum(e)}.reduce(:&)
end

def check_sum(block)
    block.reduce(:+) == 45
end

=begin

* each_slice
(1..10).each_slice(3) { |a| p a }
=> [1, 2, 3]
=> [4, 5, 6]
=> [7, 8, 9]
=> [10]

* transpose 轉置陣列
[[1, 2, 3], [4, 5, 6]].transpose
=> [[1, 4], [2, 5], [3, 6]

* reduce 收斂  等同於 inject
(1..4).reduce(:+)
=> 10
(5..10).inject {|sum, n| sum + n }            
=> 45

=end

