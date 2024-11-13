# frozen_string_literal: true

require 'test_helper'

class Api::V1::GenerateTokenControllerTest < ActionDispatch::IntegrationTest
  test 'generate an api token' do
    ApiToken.delete_all

    assert_difference('ApiToken.count', +1) do
      post api_v1_generate_token_path, params: { api_token: { user_email: 'new@email.com' } }

      token = ApiToken.last

      assert_response :created
      assert_equal({ 'Bearer token' => token.token, 'expires_at' => token.expires_at }, response.parsed_body)
    end
  end

  test 'return error when user email is invalid' do
    ApiToken.delete_all

    assert_no_difference('ApiToken.count') do
      post api_v1_generate_token_path, params: { api_token: { user_email: 'invalid email' } }

      assert_response :unprocessable_entity
      assert_equal({ 'user_email' => ['is invalid'] }, response.parsed_body)
    end
  end

  test 'prevent creation of a new token if user has an active token' do
    api_token = api_tokens(:one)

    assert_no_difference('ApiToken.count') do
      post api_v1_generate_token_path, params: { api_token: { user_email: api_token.user_email } }

      assert_response :ok
      assert_equal({ 'Bearer token' => api_token.token, 'expires_at' => api_token.expires_at }, response.parsed_body)
    end
  end
end
