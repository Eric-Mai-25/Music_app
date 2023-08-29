class UsersController < ApplicationController
    def new 
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login!
            redirect users_url
        else    
            flash.now[:error] = @user.errors.full_messages
            render :new
        end
        
    end

    def show
        @user = User.find_by(id: params[:id])
        render :show
    end

    def destroy
        @user = User.find_by(id: params[:id])
        @user.destroy
        redirect_to users_url
    end

    private
    def user_params
        params.require(:user).permit(:email)
    end
end
