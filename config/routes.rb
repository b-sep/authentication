# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      controller :foo_bar do
        get 'foo-bar' => :foo_bar
      end
    end
  end

  # health check
  get 'up' => 'rails/health#show', as: :rails_health_check
end
