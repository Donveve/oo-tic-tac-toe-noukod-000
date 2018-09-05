class TicTacToe

WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]
  def initialize
    @board =  Array.new(9, " ")
  end

    def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  # move: Note that we deleted the boar arguement, and added @ to board.  For instance, #move was move(board, position, char), but now board is intialized, so it is a characteristic of TicTacToe, no need to have it as an argument.  So, #move became simply move(position, char).


  def move(index, current_player = "X")
    @board[index] = current_player
  end

# For #move to work, we need to position_taken and valid_move
  def position_taken?(index)
    !(@board[index].nil?  || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end


#turn_count
  def turn_count
    turn = 0
    @board.each do |index|
    if index == "X" || index == "O"
        turn += 1
    end
  end
    return turn
  end

#current_player
  def current_player
    num_turns = turn_count
    if num_turns % 2 == 0
player = "X"
else
  player = "O"
end
  return  player
end

#turn
def turn
    puts "Please enter 1-9:"
  user_input = gets.chomp
    index = input_to_index(user_input)
    if valid_move?(index)
      player_token = current_player
      move(index, player_token)
      display_board
    else
      turn
    end
end

#won?
def won?
  WIN_COMBINATIONS.each {|win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    position_1 = @board[index_0]
    position_2 = @board[index_1]
    position_3 = @board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
return win_combo
 elsif
   position_1 == "O" && position_2 == "0" && position_3 == "O"
   return win_combo
 end
 }
 return false
 end




#full?
def full?
  @board.all? {|index| index == "X" || index == "O"}
end

#draw
def draw?
if !won? && full?
  return true
else
  return false
end
end

#over?
def over?
if won? || draw?
  return true
else
  return false
end
end

#winner?
def winner
   x_arrays = @board.select do |cell|
    cell == 'X'
  end

  o_arrays = @board.select do |cell|
    cell == 'O'
  end

  if x_arrays.size > o_arrays.size
    return 'X'
  elsif o_arrays.size > x_arrays.size
    return 'O'
  else
    return nil
  end
end



#play
def play
  while over? == true
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

