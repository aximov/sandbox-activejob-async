class SwitchableJob < ApplicationJob

  case self.queue_adapter_name
  when 'async'
    def perform(context_async, *args)
      puts context_async
      puts context_async.key, context_async.value
      puts 'did an async thing'
    end
  else
    def perform(*args)
      puts 'did a thing'
    end
  end
end