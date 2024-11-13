# frozen_string_literal: true

class Api::V1::FooBarController < ApplicationController
  def foo_bar
    render json: { message: "congrats #{user_email}, you have a token :)" }, status: :ok
  end
end
