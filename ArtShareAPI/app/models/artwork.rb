# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  img_url    :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artwork < ApplicationRecord
  validates :title, :artist_id, presence: true
  validates :img_url, presence: true, uniqueness: true
  validates_uniqueness_of :artist_id, scope: :title
  validates :favorite, inclusion: { in: [true, false] }

  belongs_to :artist,
    foreign_key: :artist_id,
    class_name: :User

  has_many :artworkshares,
    foreign_key: :artwork_id,
    class_name: :Artworkshare

  has_many :shared_viewers,
    through: :artworkshares,
    source: :viewer

  has_many :comments,
    foreign_key: :artwork_id,
    class_name: :Comment,
    dependent: :destroy

  has_many :likes, 
    as: :liked_object

  has_many :likers,
    through: :likes,
    source: :user

  has_many :collections,
    foreign_key: :artwork_id,
    class_name: :Collection  
end
