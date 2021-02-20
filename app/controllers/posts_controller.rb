class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index,:show]

    def new
        @post = Post.new
        @user = current_user
        @pets = @user.pets
    end

    def index
        @posts = Post.all
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        if @post.save
            redirect_to post_path(@post.id)
        else
            render 'new'
        end
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def post_params
        params.require(:post).permit(:title,:body,:image,:pet_id)
    end
end
