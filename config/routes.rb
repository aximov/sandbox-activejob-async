# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/ping', to: lambda { |_|
    c = ContextAsync.new('thisiskey', 'thisisvalue')
    # HelloAsyncJob.perform_later(c)
    UseSwitchable.perform_later(c)
    [200, {}, ['pong']]
  }
end
