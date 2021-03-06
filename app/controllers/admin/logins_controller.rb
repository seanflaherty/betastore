class Admin::LoginsController < ApplicationController
  layout 'login'

#SCF
  skip_before_action :require_login, only: [:new, :create]

  # def create
  #   user = User.find_by(email: params[:email])
  #   if user.try(:authenticate, params[:password])
  #     session[:user_id] = user.id
  #     flash[:notice] = "Welcome back!"
  #     redirect_to admin_products_path
  #   else
  #     flash.now[:danger] = 'Log In Failed'
  #     render 'new'
  #   end
  # end
  #SCF Alternative version of the create method
  #Don't think it works.
    def create
    user = User.find_by(email: params[:email])

    if user && authenticate_user!
      session[:user_id] = user.id

      flash[:notice] = "Welcome back!"
      redirect_to admin_products_path
    else
      flash.now[:danger] = 'Log In Failed'
      render 'new'
    end
  end
end
