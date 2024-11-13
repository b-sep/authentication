# frozen_string_literal: true

class ApiToken < ApplicationRecord
  before_validation :generate_token, on: :create

  # validates :token, presence: true, uniqueness: { scope: :user_email }
  validates :user_email, format: { with: URI::MailTo::EMAIL_REGEXP }

  scope :active, -> { where(active: true) }

  private

  def generate_token
    self.token = Digest::MD5.hexdigest(SecureRandom.hex)
  end
end
