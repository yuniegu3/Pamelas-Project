class StudentsController < ApplicationController

	before_action :authenticate_user!
	# GET    /students(.:format)  students#index
	def index
		@students = Student.all.order(lastname: :asc)
	end
	
	#GET    /students/:id(.:format)     students#show
	def show
		@student = Student.find(params[:id])
	end
	
	#GET    /students/new(.:format)     students#new
	def new
		@student = Student.new
	end
	
	#POST   /students(.:format)    students#create
	def create 
		Student.create(student_params)
		redirect_to '/students'
	end
	
	#GET    /students/:id/edit(.:format)       students#edit
	def edit 
		@student = Student.find(params[:id])
	end
 	
 	#PATCH  /students/:id(.:format)   students#update
 	#PUT    /students/:id(.:format)   students#update
	def update
		@student = Student.find(params[:id])
        @student.update(student_params)
        redirect_to '/students'
	end
	
	#DELETE /students/:id(.:format)   students#destroy
	def destroy
		Student.find(params[:id]).destroy
		redirect_to '/students'
	end

	private

	def student_params
    	params.require(:student).permit(:firstname, :lastname, :age, :education, :user_id, :cohort_id, :id)
    end
end
