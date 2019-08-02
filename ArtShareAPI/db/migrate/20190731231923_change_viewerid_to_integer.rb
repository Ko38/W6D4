class ChangeVieweridToInteger < ActiveRecord::Migration[5.2]
  def change
    remove_column :artworkshares, :viewer_id
    add_column :artworkshares, :viewer_id, :string, unique: true
  end
end
