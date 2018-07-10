class User < ApplicationRecord
  validates :name, presence: true

  has_many :artworks,
    foreign_key: :artist_id,
    class_name: Artwork

end
