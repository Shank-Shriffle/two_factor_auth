class User < ActiveRecord::Base
  attr_accessor :password 
  
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  before_save :encrypt_password

  def encrypt_password
    self.password_digest = BCrypt::Password.create(password)
  end

  def authenticate(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def self.authenticate(email, password)
    user = find_by(email: email)
    return nil unless user
    return user if user.authenticate(password)
  end
end
