class Doctor < ApplicationRecord
	has_many :appointments
	has_many :patients, through: :doctors
	belongs_to :city
	has_many :specialty, through: :jointablespecialtydoctor
end
