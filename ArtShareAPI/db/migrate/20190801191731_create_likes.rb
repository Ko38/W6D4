class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :user_id, null: false
      t.integer :liked_object_id, null: false
      t.string :liked_object_type, null: false
      t.index :liked_object_id
      t.index :user_id

      t.timestamps
    end
  end
end
