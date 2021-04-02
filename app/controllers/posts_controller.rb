class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index]

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
        @post = Post.find(params[:id])
        @post_comments = @post.post_comments
        @user = @post.user
        @pet = @post.pet
        @post_comment = PostComment.new
    end

    def edit
        @post = Post.find(params[:id])
        @user = @post.user
        if @user != current_user
            redirect_to post_path(@post.id)
        end
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to post_path(@post.id)
        else
            render 'edit'
        end
    end

    def destroy
    end

    private

    def post_params
        params.require(:post).permit(:title,:body,:image,:pet_id)
    end
end
