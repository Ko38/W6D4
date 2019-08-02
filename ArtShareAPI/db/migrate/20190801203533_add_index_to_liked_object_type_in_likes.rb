class AddIndexToLikedObjectTypeInLikes < ActiveRecord::Migration[5.2]
  def change
    add_index :likes, :liked_object_type
  end
end
