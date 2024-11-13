# frozen_string_literal: true

require 'test_helper'

class ApiTokenTest < ActiveSupport::TestCase
  test 'validates email' do
    token = ApiToken.new(user_email: 'invalid', token: '1')

    assert_predicate(token, :invalid?)
    assert_equal(['User email is invalid'], token.errors.full_messages_for(:user_email))
  end

  test 'active scope' do
    active_tokens = ApiToken.active

    assert_not_includes(active_tokens, api_tokens(:two))
  end
end
