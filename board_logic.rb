#create board array, takes input and creates array
def create_new_board()
	board_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
end

#take input and create new board with variable
def update_board(board, position, marker)
	board[position] = marker
	board
end	

#take input and make sure the position is valid
def validating_position?(board, position, marker)
 	board[position] == position + 1
end	

#take input and make sure winning combination are valid(these are all possible winning combinations)
def winner?(board, marker)
	if board[0] == marker && board[1] == marker && board[2] == marker ||
	   board[3] == marker && board[4] == marker && board[5] == marker ||
	   board[6] == marker && board[7] == marker && board[8] == marker ||
	   board[2] == marker && board[4] == marker && board[6] == marker ||
	   board[0] == marker && board[4] == marker && board[8] == marker ||
	   board[0] == marker && board[3] == marker && board[6] == marker ||
	   board[1] == marker && board[4] == marker && board[7] == marker ||
	   board[2] == marker && board[5] == marker && board[8] == marker
		true
	else
		false	
	end
end	   	

def cats_game?(board)
	board.all? do |value| 
		value.class == String	
	end
end	

 def game_over?(board, marker)
 	winner?(board, marker) || 
	cats_game?(board)
end		

def get_available_spaces(board)
	available_spaces = []
	board.each do |value| 
		if value.is_a?(Fixnum)
			available_spaces << value
		end
	end
	available_spaces
end	

# def cats_game(board)
# 	board_array = []
# 	board.each do |value|
# 		if value == "X" || value == "O"
# 			board_array << value
# 		end
# 	end
# 	if board_array.count == 9
# 		true
# 	else
# 		false
# 	end				


# end	 
