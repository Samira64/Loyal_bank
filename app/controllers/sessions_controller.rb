class SessionsController < ApplicationController
layout 'modern'

	def index
		redirect_to companies_url if current_user
		render "new" unless current_user
	end

	def new
	end

	def create
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id]= user.id
			redirect_to companies_url, notice: "Log in successful!"
		else
			flash.now.alert = "The email or password you entered is invalid. Please try again"
			render "new"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, notice: "Logout Successful!"
	end

end
