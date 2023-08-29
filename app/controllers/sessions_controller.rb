class SessionsController < ApplicationController
    def new
        render :new
    end

    def create
        @user = User.finy_by_credentials(params[:user][:email], params[:user][:password])
        if @user
            login!
            redirect users_url
        else
            flash.now[:errors] = ['Not user found with that username or password']
            render user_url(@user)
        end

    end

    def destroy
        logout!
        redirect users_url
    end
end
