class UsersController < ApplicationController
    before_action :authenticate_user!, except: [:index, :cancel_done]
    before_action :authenticate_admin!, only: [:index]

    def show
        @user = User.find(params[:id])
        @pets = @user.pets
        @posts = @user.posts
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render 'edit'
        end
    end

    def index
        @users = User.all
    end

    def confirm
        @user = User.find(params[:id])
    end

    def cancel
        @user = User.find(params[:id])
        @user.destroy
        redirect_to cancel_done_users_path
    end

    def cancel_done
    end

    def pets_index
        @user = User.find(params[:id])
        @pets = @user.pets
    end

    def followings
        @user = User.find(params[:id])
    end

    def followers
        @user = User.find(params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:name,:introduction,:image)
    end
end
