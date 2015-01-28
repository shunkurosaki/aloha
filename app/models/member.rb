class Member < ActiveRecord::Base
  before_save { self.name = name.downcase }
  validates :name, presence: true, length: { maximum: 12 }
  validates :password, length: { minimum: 4 }
  has_secure_password
end