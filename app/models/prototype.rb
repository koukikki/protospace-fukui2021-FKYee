class Prototype < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy

  with_options presence: true do
    validates :name
    validates :catch_copy
    validates :concept
    validates :image
  end
end
