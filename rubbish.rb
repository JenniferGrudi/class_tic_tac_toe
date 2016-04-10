require_relative "tic_tac_toe.rb"

def get_move(board)
	available_spaces = get_available_spaces(board)
	available_spaces.first
end			