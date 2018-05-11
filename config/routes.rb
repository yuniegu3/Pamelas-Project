Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :students
	resources :instructors

	resources :courses do
		resources :cohorts
	end
	root to: "home#index"
end
