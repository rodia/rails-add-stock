class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = I18n.t 'account_activations.edit.activation'
      redirect_to [:admin, user]
    else
      flash[:danger] = I18n.t 'account_activations.edit.invalid_activation'
      redirect_to root_url
    end
  end
end
