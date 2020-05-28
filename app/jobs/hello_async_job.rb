class HelloAsyncJob < ApplicationJob
  queue_as :default

  def perform(context_async, *args)
    puts context_async
    puts context_async.key, context_async.value
    puts 'did a thing'
  end
end
