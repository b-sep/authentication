# frozen_string_literal: true

class Api::V1::GenerateTokenController < ApplicationController
  skip_before_action :authenticate

  def generate_token
    return render_api_token(@set_api_token, :ok) if set_api_token

    token = ApiToken.new(api_token_params)
    return render json: token.errors, status: :unprocessable_entity if token.invalid?

    token.save

    render_api_token(token, :created)
  end

  private

  def api_token_params
    params.require(:api_token).permit(:user_email)
  end

  def set_api_token
    @set_api_token ||= ApiToken.active.find_by(user_email: api_token_params[:user_email])
  end

  def render_api_token(token, status)
    render json: { 'Bearer token': token.token, expires_at: token.expires_at }, status: status
  end
end
