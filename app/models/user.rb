class User < ApplicationRecord
  has_secure_password

  VALID_PASSWORD_REGEX = /\A[\w\-]+\z/

  validates :name, presence: true, length: { maximum: 30, allow_blank: true }
  validates :password, presence: true, length: { minimum: 8 },
    format: { with: VALID_PASSWORD_REGEX }, allow_nil: true
  validates :is_active, inclusion: { in: [ true, false ] }
  validates :is_admin, inclusion: { in: [ true, false ] }
end
