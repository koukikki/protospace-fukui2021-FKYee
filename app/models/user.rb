class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :prototypes
  has_many :comments
  has_many :sns_credentials

  with_options presence: true do
    validates :name
    validates :profile
    validates :affiliation
    validates :position
  end
end
