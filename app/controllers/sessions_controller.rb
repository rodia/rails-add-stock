class SessionsController < ApplicationController
	
	layout 'clear'
	
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			log_in user
			redirect_to [:admin, user]
		else
			flash.now[:danger] = I18n.t 'sessions.create.msg.password_email_issue'
			render :new
		end
	end

	def destroy
		log_out
		redirect_to root_url
	end
end
