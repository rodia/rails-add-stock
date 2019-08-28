class SessionsController < ApplicationController
  layout 'clear'

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_to admin_dashboard_path
      else
        message = I18n.t 'session.create.msg.account_activate'
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = I18n.t 'sessions.create.msg.password_email_issue'
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_path
  end
end
