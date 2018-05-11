class Cohort < ApplicationRecord
	#belongs_to :course
	has_one :instructor
	has_many :students
end
