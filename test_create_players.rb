require "minitest/autorun"
require_relative "create_players.rb"

class TestPlayers <Minitest::Test

	def test_last_available_space
		assert_equal(1, get_move([1 , "X", "O", "X", "O", "X", "X", "O", "O"]))
		assert_equal(5, get_move(["O" , "X", "O", "X", 5, "X", "X", "O", "O"]))
	end

	def test_multiple_available_spaces	
		#look up minitest assertions
		assert_includes([1,2,3], get_move([1 , 2, 3, "X", "X", "X", "X", "O", "O"]))
		refute_includes([4,5,6,7], get_move([1 , 2, 3, "X", "X", "X", "X", "O", "O"]))
	end	

end	