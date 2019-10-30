# frozen_string_literal: true

class User < ApplicationRecord
  before_create :create_remember_token
  has_many :posts

  validates :name, presence: true, length: { maximum: 50 }, uniqueness:

  has_secure_password
  validates :password_digest, presence: true, length: { minimum: 6 }

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token = User.digest(User.new_remember_token)
  end
end
