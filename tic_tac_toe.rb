#create board array, takes input and creates array
def create_new_board()
	board_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
end

#take input and create board with new positi
def update_board(board, position, marker)
	board[position] = marker
	board
end	


def validating_position?(board, position, marker)
 	board[position] == position + 1
end	



