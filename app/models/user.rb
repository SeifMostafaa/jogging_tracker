class User < ApplicationRecord
  resourcify
  
  api_guard_associations blacklisted_token: 'blacklisted_tokens'
  has_many :jogging_times, dependent: :destroy
  has_many :blacklisted_tokens, dependent: :delete_all

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }


  def normal_user?
    self.role == "normal_user"
  end

  def manager_user?
    self.role == "user_manager"
  end

  def admin?
    self.role == "admin"
  end
end
