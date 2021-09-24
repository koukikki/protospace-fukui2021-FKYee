class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :prototype

  with_options presence: true do
    validates :score
    validates :text
  end
end
