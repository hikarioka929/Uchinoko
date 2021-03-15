class PostCommentsController < ApplicationController

    def create
        @post = Post.find(params[:post_id])
        @post_comments = PostComment.all
        @post_comment = current_user.post_comments.new(post_comment_params)
        @post_comment.post_id = @post.id
        @post_comment.save
    end

    def destroy
        @post = Post.find(params[:post_id])
        PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    end

    private

    def post_comment_params
        params.require(:post_comment).permit(:body)
    end
end
