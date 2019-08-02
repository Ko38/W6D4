class AddFavoriteColumnToArtworkshares < ActiveRecord::Migration[5.2]
  def change
    add_column :artworkshares, :favorite, :boolean, default: false
  end
end
