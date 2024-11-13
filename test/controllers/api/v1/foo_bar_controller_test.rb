# frozen_string_literal: true

require 'test_helper'

class Api::V1::FooBarControllerTest < ActionDispatch::IntegrationTest
  test 'gets foo-bar when authentication token is valid' do
    api_token = api_tokens(:one)

    get api_v1_foo_bar_path, headers: { HTTP_AUTHORIZATION: "Bearer #{api_token.token}" }

    assert_response :ok
    assert_equal({ 'message' => "congrats #{api_token.user_email}, you have a token :)" }, response.parsed_body)
  end

  test 'requires an active token to get foo-bar' do
    api_token = api_tokens(:two)

    get api_v1_foo_bar_path, headers: { HTTP_AUTHORIZATION: "Bearer #{api_token.token}" }

    assert_response :unauthorized
  end

  test 'requires bearer token to get foo-bar' do
    get api_v1_foo_bar_path

    assert_response :unauthorized
    assert_equal(
      { 'message' => 'Missing or invalid token, to generate a token go to: /api/v1/generate_token' },
      response.parsed_body
    )
  end
end
