class ArtworksharesController < ApplicationController
  def create
    artworkshare = Artworkshare.new(artworkshare_params)

    if artworkshare.save
      render json: artworkshare
    else
      render json: artworkshare.errors.full_messages, status: 422
    end
  end

  def destroy
    begin
      artworkshare = Artworkshare.find_by(id: params[:id])
      artworkshare.destroy
      render json: artworkshare
    rescue
      render json: "Can't unshare this artwork!"
    end

  end

  private

  def artworkshare_params
    params.require(:artworkshare).permit(:artwork_id, :viewer_id)
  end

end
