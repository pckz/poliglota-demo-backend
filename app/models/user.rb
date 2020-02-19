class User < ApplicationRecord
	belongs_to :location
	def city
		location.name
	end
end
