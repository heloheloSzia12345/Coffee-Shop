require 'digest/sha1'
require 'securerandom'

class User < ApplicationRecord
  attr_accessor :password, :password_confirmation

  has_many :orders, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true, if: :password_required?

  before_save :encrypt_password

  def first_name
    name.to_s.split.last
  end

  def max_points
    10
  end

  # Gyakorlati hitelesítés email és jelszó alapján:
  def self.authenticate(email, password)
    user = User.where(email: email).take
    user && user.authenticated?(password) ? user : nil
  end

  def authenticated?(password)
    return false if encrypted_password.blank? || salt.blank?
    self.encrypted_password == User.encrypt(password, self.salt)
  end

  def self.encrypt(pass, salt)
    Digest::SHA1.hexdigest("#{pass}#{salt}")
  end

  private

  def password_required?
    new_record? || password.present?
  end

  def encrypt_password
    return if password.blank?
    if new_record? || salt.blank?
      self.salt = SecureRandom.base64(16)
    end
    self.encrypted_password = User.encrypt(password, self.salt)
  end
end
