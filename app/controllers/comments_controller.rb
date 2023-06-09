class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post

    def create
        @comment = @post.comments.create(comment_params)
        @comment.user = current_user 

        if @comment.save 
            flash[:notice] = "Holy shit you made a comment"
            redirect_to post_path(@post)
        else
            flash[:alert] = "Nevermind"
            redirect_to post_path(@post)
        end
    end

    def destroy 
       @comment = @post.comment.find(params[:id])
       @comment.destroy
       redirect_to post_path(@post)
    end

    def update 
        @comment = @post.comments.find(params[:id])

        respond_to do |format|
            if @comment.update(comment_params)
                format.html { redirect_to post_path(@post), notice: 'Comment Updated' }
            else
                format.html { redirect_to post_path(@post), alert: 'Oops no update' }
            end
        end
    end

    private 

    def set_post
        @post = Post.find(params[:post_id])
    end

    def comment_params 
        params.require(:comment).permit(:body)
    end
end
