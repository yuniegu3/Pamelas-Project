class CohortsController < ApplicationController
	#belongs_to :course
	has_one :instructor
	has_many :students
end
