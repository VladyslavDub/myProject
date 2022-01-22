class CommentsController < ApplicationController
    before_action :authenticate_user!, only: %i[create destroy]

  def create
    @comment = current_user.comments.build(comment_paramas)
    @comment.commentable = commentable
    @comment.save

    return redirect_to(commentable) if commentable.class.name != "Comment"

    redirect_back(fallback_location: root_path)
  end

  def destroy
    if @comment = current_user.comments.find_by(id: params[:id])
      @comment.delete
      return redirect_back(fallback_location: root_path)
    end
  end

  private

  def commentable
    commentable_model.find(params[:commentable_id])
  end

  def commentable_model
    params[:commentable_type].constantize
  end

  def comment_paramas
    params.require(:comment).permit(:text,:user_id)
  end
end
