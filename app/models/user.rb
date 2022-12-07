require 'validator/email_validator'

class User < ApplicationRecord
  has_secure_password
  before_validation :downcase_email

  VALID_PASSWORD_REGEX = /\A[\w\-]+\z/

  validates :name, presence: true, length: { maximum: 30, allow_blank: true }
  validates :email, presence: true, email: { allow_blank: true }
  validates :password, presence: true, length: { minimum: 8 }, allow_nil: true,
    format: {
      with: VALID_PASSWORD_REGEX,
      message: :invalid_password
    }
  validates :is_active, inclusion: { in: [ true, false ] }
  validates :is_admin, inclusion: { in: [ true, false ] }

  def is_email_active?
    users = User.where.not(id: self.id)
    users.find_by(email: self.email, is_active: true).present?
  end

  private

  def downcase_email
    self.email.downcase! if email
  end
end
