class CommentsController < ApplicationController

  def index
    input_user_id = params[:user_id]
    input_artwork_id = params[:artwork_id]

    if input_user_id.nil? && !input_artwork_id.nil?
      comments = Comment.where(artwork_id: input_artwork_id)
    elsif !input_user_id.nil? && input_artwork_id.nil?
      comments = Comment.where(user_id: input_user_id)
    elsif !input_user_id.nil? && !input_artwork_id.nil?
      comments = Comment.where(user_id: input_user_id, artwork_id: input_artwork_id)
    end
    
    if comments.empty?
      render json: "No comment found!", status: 422
    else
      render json: comments
    end
  end

  def create
    comment = Comment.new(comment_params)

    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages, status: 422
    end
  end

  def destroy
    begin
      comment = Comment.find_by(id: params[id])
      comment.destroy
      render json: comment
    rescue
      render json: "Invalid comment!", status: 422
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :artwork_id, :body)
  end

end
