class CoursesController < ApplicationController

	before_action :authenticate_user!
	#GET    /courses(.:format) courses#index
	def index
		@courses = Course.all.order(name: :asc)
	end
	
	#GET    /courses/:id(.:format) courses#show
	def show
		@course = Course.find(params[:id])
	end
	
	#GET    /courses/new(.:format) courses#new
	def new
		@course = Course.new
	end
	
	#POST   /courses(.:format) courses#create
	def create 
		Course.create(course_params)
		redirect_to '/courses'
	end
	
	#GET    /courses/:id/edit(.:format) courses#edit
	def edit 
		@course = Course.find(params[:id])
	end
	
	# PATCH  /courses/:id(.:format) courses#update
    # PUT    /courses/:id(.:format) courses#update
	def update
		@course = Course.find(params[:id])
        @course.update(course_params)
        redirect_to '/courses'
	end

	#DELETE /courses/:id(.:format) courses#destroy
	def destroy
		Course.find(params[:id]).destroy
		redirect_to '/courses'
	end

	private

	def course_params
    	params.require(:course).permit(:name, :location, :total_hours, :id)
    end
end
