class Student < ApplicationRecord
	#belongs_to :cohort
	validates_numericality_of :age, :in => 1..150
end
