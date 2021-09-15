class Prototype < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :catch_copy
    validates :concept
    validates :image
  end
end
