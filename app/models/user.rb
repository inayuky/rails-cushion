class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 100}
  validates :email, presence: true
  validates :password, presence: true

  has_secure_password
end
