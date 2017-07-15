class UsersController < ApplicationController

	def index
		@users = User.all
		@user = User.new
		render layout: 'modern'
	end

	def new
		redirect_to action: 'index'
	end

	def create 
		@user= User.new(user_params)
		if @user.save
			redirect_to companies_url, notice: "The user  \"#{@user.name}\"   was built successfully."
		else
			render "new"
		end
	end

	def destroy
	end


	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :last_login, :login_count)
	end

end

