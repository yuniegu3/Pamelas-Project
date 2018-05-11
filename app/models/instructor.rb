class Instructor < ApplicationRecord
	#belongs_to :cohort
	validates :age, numericality: {less_than_or_equal_to: 150}
	validates :salary, numericality: {greater_than: 0}
end
