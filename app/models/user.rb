class User < ApplicationRecord
  has_secure_password
  has_many :posts

  validates :email, uniqueness: true
  validates_format_of :email, with: /@/
  validates :password, length: { minimum: 4}
end
