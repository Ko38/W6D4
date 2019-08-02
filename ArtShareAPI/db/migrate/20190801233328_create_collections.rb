class CreateCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :collections do |t|
      t.integer :collection_id, null: false
      t.integer :user_id, null: false
      t.integer :artwork_id, null: false

      t.index :user_id
      t.index [:collection_id, :user_id, :artwork_id], unique: true
      t.timestamps
    end

  end
end
