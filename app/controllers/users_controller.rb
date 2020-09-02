class UsersController < ApplicationController
    def new
      @user = User.new
    end

    def create # Sign Up A New User
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to @user
      else
        redirect_to new_user_path
      end
    end
    
    def show
      if logged_in?
        @user = User.find_by_id(params[:id])
      else
        redirect_to root_url
      end
    end

    private 
    def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
    end    
end