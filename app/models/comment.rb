class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :prototype

  validates :score, presence: true

end
