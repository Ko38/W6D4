# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :artworks,
    foreign_key: :artist_id,
    dependent: :destroy,
    class_name: :Artwork
    

  has_many :artworkshares,
    foreign_key: :viewer_id,
    dependent: :destroy,
    class_name: :Artworkshare
    

  has_many :shared_artworks,
    through: :artworkshares,
    source: :artwork

  has_many :comments,
    foreign_key: :user_id,
    class_name: :Comment,
    dependent: :destroy

  has_many :likes,
    foreign_key: :user_id,
    class_name: :Like

  has_many :liked_comments,
    through: :likes,
    source: :liked_object,
    source_type: :Comment

  has_many :liked_artworks,
    through: :likes,
    source: :liked_object,
    source_type: :Artwork

  has_many :collections,
    foreign_key: :user_id,
    class_name: :Collection

  has_many :collection_artworks,
    through: :collections,
    source: :artwork

  def favorite_own_artworks
    self.artworks.select{ |artwork| artwork.favorite }
  end

  def favorite_shared_artworks
    self.artworkshares.select{ |share| share.favorite }
  end
  
  def favorite_artworks
    (favorite_own_artworks + favorite_shared_artworks).uniq
  end

  def get_collection_by(collection_id)
    collections.select{ |collection| collection.collection_id == collection_id}
  end
end
