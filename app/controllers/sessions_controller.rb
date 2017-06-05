class SessionsController < ApplicationController
layout 'modern'

	def new	 
	end

	def create
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id]= user.id 
			redirect_to companies_url, notice: "Log in successful!"
		else
			flash.now.alert = "Invalid email or password!"
			render "new"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, notice: "Logout Successful!"
	end

end
