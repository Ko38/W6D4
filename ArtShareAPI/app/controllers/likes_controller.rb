class LikesController < ApplicationController

  def index
    input_artwork_id = params[:artwork_id]
    input_comment_id = params[:comment_id]
    likers = []

    begin
      if input_comment_id.nil? && !input_artwork_id.nil?
        likers = Artwork.find_by(id: input_artwork_id).likers
      elsif !input_comment_id.nil? && input_artwork_id.nil?
        likers = Comment.find_by(id: input_comment_id).likers
      end
    rescue
      render json: "Object not found!", status: 422
      return
    end

    if likers.empty?
      render json: "Sorry :( no like!"
    else
      render json: likers
    end
  end


  def destroy
    begin
      like = Like.find_by(id: params[:id])
      like.destroy
      render json: "Delete #{like.user.username}'s like for #{like.liked_object}'"
    rescue 
      render json: "Cannot remove this like!", status: 422
    end

  end

  def create
    like = Like.new(likes_params)

    if like.save
      render json: like
    else
      render json: like.errors.full_messages, status: 422
    end
  end

  private

  def likes_params
    params.require(:like).permit(:user_id, :liked_object_id, :liked_object_type)
  end
end
