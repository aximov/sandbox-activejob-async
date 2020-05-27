class HelloAsyncJob < ApplicationJob
  queue_as :default

  include SerializeContext

  def perform(*args)
    puts @context_out
    puts 'did a thing'
  end
end
