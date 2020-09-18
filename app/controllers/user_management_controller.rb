class UserManagementController < ApplicationController
  include UserManagementRails::Concerns::UserResource

  def signup
    if current_user_hash(false)
       redirect_to action: 'home'
    else
      render 'signup'
    end
  end

  def login
    if current_user_hash(false)
      redirect_to action: 'home'
    else
      render 'login'
    end
  end

  def home
    if current_user_hash(false)
      @userinfo = current_user_hash.values_at("phone","email")
    else
      redirect_to action: 'login'
    end
  end

  def logout
    current_user_logout
    redirect_to action: 'login'
  end
end
