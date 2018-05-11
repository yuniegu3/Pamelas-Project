class Course < ApplicationRecord
	has_many :cohort
	validates :total_hours, :numericality => { :greater_than => 0 }
end
