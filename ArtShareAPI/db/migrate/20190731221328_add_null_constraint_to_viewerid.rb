class AddNullConstraintToViewerid < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:artworkshares, :viewer_id, true)
  end
end
