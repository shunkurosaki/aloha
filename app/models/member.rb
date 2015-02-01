class Member < ActiveRecord::Base
  has_many :friendships, :dependent => :destroy
  has_many :friends, :through => :friendships

  before_save { self.name = name.downcase }
  validates :name, presence: true, length: { maximum: 12 }
  validates :password, length: { minimum: 4 }
  has_secure_password

  def Member.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def Member.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
    def create_remember_token
      self.remember_token = Member.encrypt(Member.new_remember_token)
    end
end