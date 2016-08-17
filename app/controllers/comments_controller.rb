class CommentsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_comment, only: [:destroy]
  before_action :authorize_customer!, only: [:destroy]

  def create
    @place = Place.find(params[:place_id])
    @comment = @place.comments.new(comment_params)
    @comment.customer = current_customer

    if @comment.save
      CommentMailer.new_comment(@place).deliver_now
      redirect_to place_path(@place)
    end
  end

  def destroy
    @place = Place.find(params[:place_id])
    @comment = @place.comments.find(params[:id])
    @comment.destroy
    redirect_to place_path(@place)
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def authorize_customer!
    redirect_to @place, notice: "Not authorized" unless @comment.customer_id == current_customer.id
  end
end
