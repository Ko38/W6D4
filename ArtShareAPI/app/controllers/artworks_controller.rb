class ArtworksController < ApplicationController
  def index
    user = User.find_by(id: params[:user_id])
    artworks = user.artworks.concat(user.shared_artworks).uniq
    render json: artworks
  end

  def create
    artwork = Artwork.new(artwork_params)
    
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

   def show
    begin
      artwork = Artwork.find(params[:id])
      render json: artwork
    rescue
      render json: "artwork doesn't exist", status: 422
    end
  end

  def update
    begin
      artwork = Artwork.update(params[:id], artwork_params)
      render json: artwork
    rescue
      render json: "artwork doesn't exist", status: 422
    end
  end

  def destroy
    begin
      artwork = Artwork.find(params[:id])
      artwork.destroy
      render json: "Removed!"
    rescue
      render json: "artwork doesn't exist", status: 422
    end
  end


  private

  def artwork_params
    params.require(:artwork).permit(:title, :img_url, :artist_id)
  end
  
end
