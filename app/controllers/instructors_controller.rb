class InstructorsController < ApplicationController

	before_action :authenticate_user!
	#GET    /instructors(.:format)   instructors#index
	def index
		@instructors = Instructor.all.order(lastname: :asc)
	end

	#GET    /instructors/:id(.:format)   instructors#show
	def show
		@instructor = Instructor.find(params[:id])
	end

	#GET    /instructors/new(.:format)    instructors#new
	def new
		@instructor = Instructor.new
	end

	#POST   /instructors(.:format)   instructors#create
	def create 
		Instructor.create(instructor_params)
		redirect_to '/instructors'
	end



	#GET    /instructors/:id/edit(.:format)   instructors#edit
	def edit 
		@instructor = Instructor.find(params[:id])
	end

	#PATCH  /instructors/:id(.:format)   instructors#update
    #PUT    /instructors/:id(.:format)  instructors#update
	def update
		@instructor = Instructor.find(params[:id])
        @instructor.update(instructor_params)
        redirect_to '/instructors'
	end

	
	#DELETE /instructors/:id(.:format)    instructors#destroy
	def destroy
		Instructor.find(params[:id]).destroy
		redirect_to '/instructors'
	end

	private

	def instructor_params
    	params.require(:instructor).permit(:firstname, :lastname, :age, :salary, :education, :subject, :user_id, :id)
    end
end
