# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/ping', to: lambda { |_|
    HelloAsyncJob.perform_later
    [200, {}, ['pong']]
  }
end
