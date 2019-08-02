class Collection < ApplicationRecord
  validates :user_id, :collection_id, :artwork_id, presence: true
  validates_uniqueness_of :user_id, scope: [:collection_id, :artwork_id]

  belongs_to :user,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :artwork,
    foreign_key: :artwork_id,
    class_name: :Artwork

  
end
