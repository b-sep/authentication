# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate

  attr_reader :user_email

  def authenticate
    authenticate_by_token || handle_unauthorized
  end

  private

  def authenticate_by_token
    # https://api.rubyonrails.org/classes/ActionController/HttpAuthentication/Token.html
    authenticate_with_http_token do |token, _options|
      api_token = ApiToken.active.find_by(token:)

      return unless api_token

      @user_email = api_token.user_email
    end
  end

  def handle_unauthorized
    render json: { message: 'Missing or invalid token, to generate a token go to: /api/v1/generate_token' },
           status: :unauthorized
  end
end
