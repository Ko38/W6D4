class ChangeVieweridToInteger1 < ActiveRecord::Migration[5.2]
  def change
    remove_column :artworkshares, :viewer_id
    add_column :artworkshares, :viewer_id, :integer, null: false
  end
end
