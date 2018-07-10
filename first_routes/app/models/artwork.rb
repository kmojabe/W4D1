class Artwork < ApplicationRecord
  validates :title, :image_url, null: false

  belongs_to :artist,
    foreign_key: :artist_id,
    class_name: :User
end
