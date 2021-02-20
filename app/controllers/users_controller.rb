class UsersController < ApplicationController
    before_action :authenticate_user!, except: [:index]
    before_action :authenticate_admin!, only: [:index]

    def show
        @user = User.find(params[:id])
        @pets = @user.pets
        @posts = @user.posts
    end

    def edit
    end

    def update
    end

    def index
        @users = User.all
    end

    # def confirm
    # end

    # def cancel
    # end

    def pets_index
    end

    # def followings_index
    # end

    # def followers_index
    # end
end
