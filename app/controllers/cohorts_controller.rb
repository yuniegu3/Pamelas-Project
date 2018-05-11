class CohortsController < ApplicationController

	before_action :authenticate_user!

	#GET    /courses/:course_id/cohorts(.:format) cohorts#index
	def index
		@cohorts = Cohort.all
	end
	
	#GET    /courses/:course_id/cohorts/:id(.:format) cohorts#show
	def show
		@cohort = Cohort.find(params[:id])
	end
	
	#GET    /courses/:course_id/cohorts/new(.:format) cohorts#new
	def new
		@cohort = Cohort.new
	end
	
	#POST   /courses/:course_id/cohorts(.:format) cohorts#create
	def create
		Cohort.create(cohort_params)
		redirect_to '/cohorts'
	end

	#GET    /courses/:course_id/cohorts/:id/edit(.:format) cohorts#edit
	def edit 
		@cohort = Cohort.find(params[:id])
	end
	
	#PATCH  /courses/:course_id/cohorts/:id(.:format) cohorts#update
    #PUT    /courses/:course_id/cohorts/:id(.:format) cohorts#update
	def update
		@cohort = Cohort.find(params[:id])
		@cohort.update(cohort_params)
		redirect_to '/cohorts'
	end
	
	#DELETE /courses/:course_id/cohorts/:id(.:format) cohorts#destroy
	def destroy
		Cohort.find(params[:id]).destroy
        redirect_to '/cohorts'
	end

    #http://edgeguides.rubyonrails.org/action_controller_overview.html#strong-parameters
    private
    # Using a private method to encapsulate the permissible parameters is
    # just a good pattern since you'll be able to reuse the same permit
    # list between create and update. Also, you can specialize this method
    # with per-user checking of permissible attributes.
    def cohort_params
      params.require(:cohort).permit(:name, :start_date, :end_date, :instructor_id, :course_id)
    end

end
