class Stroll < ApplicationRecord
	belongs_to :city
	belongs_to :dogsitter
	has_many :dogs
end
