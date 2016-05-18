# require_relative "sequential_ai.rb"
# require_relative "simple_ai.rb"

def play_game(current_player, opponent, board)
	move = current_player[:player_mode].get_move(board)
	board = update_board(board, move - 1, current_player[:marker])
	if game_over?(board, current_player[:marker])
	   board
	else
		#switches the current player.
		play_game(opponent, current_player, board)
	end
end			

# def play_game()
# 	board = create_new_board
# 	player_one = "X"
# 	player_two = "O"

# 	until game_over?(board, player_one) == true || game_over?(board, player_two) == true do
# 		move_one = 	get_move(board)
# 		board = update_board(board, move_one - 1, player_one)
# 		break if game_over?(board, player_one) == true || game_over?(board, player_two) == true
# 		move_two = get_move_seq(board)
# 		board = update_board(board, move_two - 1, player_two)
# 	end
# 	game_over?(board, player_one) == 1 || game_over?(board, player_two) == true	 
# end	