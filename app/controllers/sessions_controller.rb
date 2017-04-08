class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
      		redirect_to users_path
      		# Log the user in and redirect to the user's show page.
      	else
      		# Create an error message.
      		flash[:danger] = 'Invalid email/password combination' # Not quite right!
      		render 'new'
		end
	end
end
