# == Schema Information
#
# Table name: artworkshares
#
#  id         :bigint           not null, primary key
#  artwork_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  viewer_id  :string           not null
#

class Artworkshare < ApplicationRecord
  validates :artwork_id, :viewer_id, presence: true
  validates_uniqueness_of :artwork_id, scope: :viewer_id
  validates :favorite, inclusion: { in: [true, false] }

  belongs_to :artwork,
    foreign_key: :artwork_id,
    class_name: :Artwork

  belongs_to :viewer,
    foreign_key: :viewer_id,
    class_name: :User
end
