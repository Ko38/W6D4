class AddIndexToLikedObjectAndUserIdinLike < ActiveRecord::Migration[5.2]
  def change
    add_index :likes, [:user_id, :liked_object_id, :liked_object_type], 
              unique: true,
              name: "index_user_object_id_and_type"
  end
end
