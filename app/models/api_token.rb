# frozen_string_literal: true

class ApiToken < ApplicationRecord
  validates :token, presence: true
  validates :user_email, format: { with: URI::MailTo::EMAIL_REGEXP }

  enum :active, { active: 0, inactive: 1 }
end
