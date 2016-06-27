class User < ApplicationRecord
  has_secure_password
  has_many :posts

  validates :email, uniqueness: true
  validates_format_of :email, with: /@/, message: "is invalid"
  validates :password, length: { minimum: 4, message: "is too short (minimum is 4 characters)"}
end
