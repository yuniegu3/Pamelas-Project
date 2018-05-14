class Instructor < ApplicationRecord
	#belongs_to :cohort
	validates :age, :inclusion => 1..149
	validates :salary, numericality: { greater_than: 0 }
end
