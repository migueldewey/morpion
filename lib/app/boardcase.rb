require "pry"

class BoardCase
	attr_accessor :position, :contenu

	def initialize(num_case)
		@contenu = nil
		@position = num_case
	end
end
#binding.pry