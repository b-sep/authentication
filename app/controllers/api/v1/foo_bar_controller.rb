# frozen_string_literal: true

class Api::V1::FooBarController < ApplicationController
  def foo_bar = head(:no_content)
end
