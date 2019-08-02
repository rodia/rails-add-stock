class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def admin_user?(user)
    user.role?(:superadmin) || user.role?(:admin)
  end
end
