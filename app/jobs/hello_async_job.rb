class HelloAsyncJob < ApplicationJob
  queue_as :default

  def serialize
    super.merge('context' => { 'context-key' => 'context-value' })
  end

  def deserialize(arguments)
    super
    puts "deserializing: #{arguments['context']}"
  end

  def perform(*args)
    puts 'did a thing'
  end
end
