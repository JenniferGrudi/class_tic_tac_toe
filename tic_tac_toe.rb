#create board array, takes input and creates array
def create_new_board()
	board_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
end

#replace position for "X". Takes input and gives back array with variable
def update_board(board, position, marker)
	board[position] = marker
	board
end	
