class UsersController < ApplicationController
		# GET /users(.:format)  users#index
	def index
		@users = User.all
	end
	
	#GET    /users/:id(.:format)     users#show
	def show
		@user = User.find(params[:id])
	end
	
	#renders a form so user can put info in (html.erb file)
	#GET    /users/new(.:format)   users#new
	def new
		@user = User.new
	end
	
	# post -> takes info from form and with post, takes that data input and creates a data
	#POST   /users(.:format)   users#create
	def create
		@users = User.all
		if @users.find_by(email: params[:email]) == nil && @users.find_by(username: params[:username]) == nil
		User.create(user_params)
        redirect_to '/users'
    	elsif @users.find_by(email: params[:email]) != nil
    		@error = "Error has occured. Email you provided is already in use."
    	elsif @users.find_by(username: params[:username]) != nil
    		@error = "Error has occured. Username is already in use"
    	end
	end
	
	# GET    /users/:id/edit(.:format)  users#edit
	def edit 
		@user = User.find(params[:id])
	end
	
	#PATCH  /users/:id(.:format)  users#update
	# PUT    /users/:id(.:format)  users#update
	def update
		@user = User.find(params[:id])
        @user.update(user_params)
        redirect_to '/users'
	end
	
	# DELETE /users/:id(.:format)  users#destroy
	def destroy
        User.find(params[:id]).destroy
        redirect_to '/users'
	end

  	private
    # Using a private method to encapsulate the permissible parameters is
    # just a good pattern since you'll be able to reuse the same permit
    # list between create and update. Also, you can specialize this method
    # with per-user checking of permissible attributes.
    def user_params
      params.require(:user).permit(:username, :password, :email, :firstname, :lastname, :level_type, :id)
    end
end
end
