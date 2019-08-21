class Admin::UsersController < AdminController
  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
    render layout: 'application' unless logged_in?
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:success] = I18n.t 'users.create.msg.send_email_verification'
      redirect_to [:admin, @user]
    else
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:firstName, :lastName, :email, :password,
                                   :password_confirmation)
    end
end
