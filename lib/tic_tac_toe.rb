class TicTacToe
  
  def initialize(board = nil)
    @board  = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  
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
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
   if @board[index] == " "
     return false
   else
     return true
    end
   end
   
   def valid_move?(index)
   if index.between?(0,8) && !position_taken?(index)
     true
  end
end
 
  def turn_count
    turn = 0
    @board.each do |index|
      if index == "X" || index == "O"
        turn += 1
    end
  end
  turn
 end
 
 def current_player
  turn_count % 2 == 0 ? "X" : "O"
 end
 
 def turn
   puts "Please make a selection between 1 and 9"
   user_input = gets.chomp
   index = input_to_index(user_input)
   if valid_move?(index)
      move(index, current_player)
    else
      turn
  end
  display_board
 end
 
 def won?
     WIN_COMBINATIONS.find do |win_combo|
       @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[0]] == @board[win_combo[2]] && position_taken?(win_combo[0])
    end
  end
  
  def full?
    @board.all? {|i| i == "X" || i == "O"}
  end
  
  def draw?
    self.full? && !self.won?
    # returns true if board is full and not been one
 end
 
 def over?
   self.won? || self.draw?
   # returns true if board has been won or is full
 end
 
 def winner
  if win_combo = self.won?
   @board[win_combo[0]]
  end
 end
 
 def play
   until self.over? do
     self.turn
  end
  self.winner
  puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
 end
end

