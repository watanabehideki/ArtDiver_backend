class Exhibition < ApplicationRecord
  belongs_to :gallery
  default_scope -> { order(created_at: :desc) }
  validates :gallery_id, presence: true
end
