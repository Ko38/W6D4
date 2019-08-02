class CreateArtworkshares < ActiveRecord::Migration[5.2]
  def change
    create_table :artworkshares do |t|
      t.integer :artwork_id, null: false
      t.integer :artist_id, null: false
      t.timestamps
    end

    add_index :artworkshares, :artwork_id
    add_index :artworkshares, :artist_id
    add_index :artworkshares, [:artwork_id, :artist_id], unique: true
  end
end
