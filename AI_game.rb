require_relative "create_players.rb"
require_relative "Simple.rb"

def play_game()
	board = create_new_board
	player_one = "X"
	player_two = "O"

	until game_over?(board, player_one) == true || game_over?(board, player_two) == true do
		move_one = 	get_move(board)
		board = update_board(board, move_one - 1, player_one)
		break if game_over?(board, player_one) == true || game_over?(board, player_two) == true
		move_two = get_move_seq(board)
		board = update_board(board, move_two - 1, player_two)
	end
	game_over?(board, player_one) == 1 || game_over?(board, player_two) == true	 
end	