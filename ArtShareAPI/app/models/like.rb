class Like < ApplicationRecord
  validates :user_id, :liked_object_id, :liked_object_type, presence: true
  validates :liked_object_type, inclusion: { in: ["Artwork", "Comment"] }

  belongs_to :liked_object,
     polymorphic: ["Artwork", "Comment"]

  belongs_to :user,
    foreign_key: :user_id,
    class_name: :User
end
