class DiceController < ApplicationController

	attr_accessor :goal

	def initialize()
		@goal = nil
		@die_1 = nil
		@die_2 = nil
		@game_end_text = ""
	end

	def start
		render "start"
	end

	def first_roll

		dice_faces = [1,2,3,4,5,6]
		losing_sums = [2,3,12]
		winning_sums = [7,11]

		@die_1 = dice_faces.sample(1)[0]
		@die_2 = dice_faces.sample(1)[0]

		if winning_sums.include?(@die_1 + @die_2)
			@game_end_text = "YOU WIN."
			render "game_end"
		elsif losing_sums.include?(@die_1 + @die_2)
			@game_end_text = "YOU LOSE."
			render "game_end"
		else
			@goal = @die_1 + @die_2
			render "goal_set"
		end

	end

	def roll_with_goal_set

		@goal = params["goal"].to_i

		dice_faces = [1,2,3,4,5,6]

		@die_1 = dice_faces.sample(1)[0]
		@die_2 = dice_faces.sample(1)[0]

		if (@die_1 + @die_2) == @goal
			@game_end_text = "YOU WIN."
			render "game_end"
		elsif (@die_1 + @die_2) == 7
			@game_end_text = "YOU LOSE."
			render "game_end"
		else
			render "roll_again"
		end

	end
end