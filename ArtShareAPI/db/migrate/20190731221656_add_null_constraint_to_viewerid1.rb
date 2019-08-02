class AddNullConstraintToViewerid1 < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:artworkshares, :viewer_id, false)
  end
end
