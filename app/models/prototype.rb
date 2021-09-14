class Prototype < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #devise :database_authenticatable, :registerable,
         #recoverable, :rememberable, :validatable

         has_many :comments
         #belongs_to :user

  with_options presence: true do
    validates :name
    validates :catch_copy
    validates :concept
    validates :image
  end

end
