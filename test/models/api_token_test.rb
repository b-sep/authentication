# frozen_string_literal: true

require 'test_helper'

class ApiTokenTest < ActiveSupport::TestCase
  context 'validations' do
    should validate_presence_of(:token)
  end

  context 'define enum' do
    should define_enum_for(:active)
  end

  test 'validates email' do
    token = ApiToken.new(user_email: 'invalid', token: '1')

    assert_predicate(token, :invalid?)
    assert_equal(['User email is invalid'], token.errors.full_messages_for(:user_email))
  end
end
