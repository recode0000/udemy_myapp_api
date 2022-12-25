require 'validator/email_validator'

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable,
    :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  VALID_PASSWORD_REGEX = /\A[\w\-]+\z/

  before_validation :downcase_email

  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, email: true

  private

  def downcase_email
    self.email.downcase! if email
  end
end
