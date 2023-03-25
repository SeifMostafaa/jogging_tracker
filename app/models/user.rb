class User < ApplicationRecord
  resourcify
  
  api_guard_associations blacklisted_token: 'blacklisted_tokens'
  has_many :blacklisted_tokens, dependent: :delete_all

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
end
