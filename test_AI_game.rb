require "minitest/autorun"
require_relative "AI_game.rb"

class TestGame <Minitest::Test
	def test_game_is_working
		assert_equal(true, play_game)
	end

	def test_available_spaces
		assert_equal([1, 2, 3], get_available_spaces([1, 2, 3, "O", "O", "X", "X", "O", "X"]))
		assert_equal([4, 5, 6], get_available_spaces(["O", "X", "X",4 ,5,6,"X", "O", "X"]))
	end	

end	