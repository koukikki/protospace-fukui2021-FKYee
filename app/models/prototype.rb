class Prototype < ApplicationRecord
  has_many :comments
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :catch_copy
    validates :concept
    validates :image
  end

  has_one_attached :image
end
