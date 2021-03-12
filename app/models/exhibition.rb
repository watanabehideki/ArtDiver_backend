class Exhibition < ApplicationRecord
  has_many :microposts, dependent: :destroy
  belongs_to :gallery
  default_scope -> { order(created_at: :desc) }
  validates :gallery_id, presence: true
  mount_uploader :exhibition_image, ExhibitionImageUploader

end
