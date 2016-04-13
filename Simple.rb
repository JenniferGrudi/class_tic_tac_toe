require_relative "board_logic.rb"

def get_move_seq(board)
	available_spaces = get_available_spaces(board)
	available_spaces.first
end			