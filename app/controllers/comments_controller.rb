class CommentsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user,   only: :destroy

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
            redirect_to @post
        else
            flash.now[:danger] = "Error saving comment."
        end
    end

    def destroy
        @comment.destroy
        flash[:success] = "Comment deleted."
        redirect_to request.referrer || root_url
    end

    def like
        @comment = comment.find(params[:id])
        if current_user.liked? @comment
            @comment.unliked_by current_user
        else
            @comment.liked_by current_user
        end

        if request.xhr?
            render json: { count: @comment.get_likes.size, id: params[:id] }
        else
            redirect_to @comment
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :picture)
    end

    def correct_user
          @comment = current_user.comments.find_by(id: params[:id])
          redirect_to root_url if @comment.nil?
    end
end
