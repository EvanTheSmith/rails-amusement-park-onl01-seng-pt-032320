class SessionsController < ApplicationController
    def new
    end

    def create # Log In With Existing User
        @user = User.find_by(name: params[:user][:name])
        # return head(:forbidden) unless @user.authenticate(params[:user][:password])
        if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to @user
        else
          redirect_to signin_path
        end
    end

    def destroy
    reset_session
    redirect_to '/'
    end
end