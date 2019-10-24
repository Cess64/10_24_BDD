class Specialty < ApplicationRecord
	has_many :doctors, through: :jointablespecialtydoctor
end
