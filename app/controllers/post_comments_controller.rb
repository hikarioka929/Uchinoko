class PostCommentsController < ApplicationController

    def create
        @post = Post.find(params[:post_id])
        @post_comment = current_user.post_comments.new(post_comment_params)
        @post_comment.post_id = @post.id
        if @post_comment.save
            redirect_to post_path(@post.id)
        else
            redirect_to post_path(@post.id)
        end
    end

    def destroy
        @post = Post.find(params[:post_id])
        PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
        redirect_to post_path(@post.id)
    end

    private

    def post_comment_params
        params.require(:post_comment).permit(:body)
    end
end