class CommentsController < ApplicationController
    before_action :authenticate_user!, only: %i[create]

  def create
    @comment = current_user.comments.build(comment_paramas)
    @comment.pin = pin
    @comment.save

    redirect_to pin
  end

  def destroy
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.find(params[:id])
    @comment.destroy
    redirect_to pin_path(@pin)
  end

  private

  def pin
      Pin.find(params[:pin_id])
  end

  def comment_paramas
    params.require(:comment).permit(:text,:user_id,:pin_id)
  end
end
