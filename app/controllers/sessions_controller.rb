class SessionsController < ApplicationController
	def new
	end

	def create
		@user =User.authentication(params[:login],params[:password])
		if @user
			session[:user_id] = @user.id
			flash[:notice] = "Weclcome #{@user.login}"
			redirect_to posts_path
		else
			flash[:notice] = "The login or password is not current..."
			redirect_to new_session_path
		end

	end

end
