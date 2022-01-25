class User < ApplicationRecord
  has_many :authentications
  has_secure_password
end
