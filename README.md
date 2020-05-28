# README

Active Job using `:async` (default) adapter

```rb
class ContextAsync
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end
```

```rb
class HelloAsyncJob < ApplicationJob
  queue_as :default

  def perform(context_async, *args)
    puts context_async
    puts context_async.key, context_async.value
    puts 'did a thing'
  end
end
```

```rb

class AsyncContextSerializer < ActiveJob::Serializers::ObjectSerializer

  def serialize?(argument)
    argument.is_a? ContextAsync
  end

  def serialize(async_context)
    super(
      'context-key' => async_context.key,
      'context-value' => async_context.value
    )
  end

  def deserialize(hash)
    ContextAsync.new(hash['context-key'], hash['context-value'])
  end
end
```

```sh
$ rails s
```

Access to `localhost:3000/ping`

```sh
Started GET "/ping" for ::1 at 2020-05-29 00:29:15 +0900
[ActiveJob] Enqueued HelloAsyncJob (Job ID: fd3b8be5-2cc1-4cac-a554-ea5fae845098) to Async(default) with arguments: #<ContextAsync:0x00007fd7e4b70868 @key="thisiskey", @value="thisisvalue">
[ActiveJob] [HelloAsyncJob] [fd3b8be5-2cc1-4cac-a554-ea5fae845098] Performing HelloAsyncJob (Job ID: fd3b8be5-2cc1-4cac-a554-ea5fae845098) from Async(default) enqueued at 2020-05-28T15:29:15Z with arguments: #<ContextAsync:0x00007fd7e4bf2d18 @key="thisiskey", @value="thisisvalue">
#<ContextAsync:0x00007fd7e4bf2d18>
thisiskey
thisisvalue
did a thing
[ActiveJob] [HelloAsyncJob] [fd3b8be5-2cc1-4cac-a554-ea5fae845098] Performed HelloAsyncJob (Job ID: fd3b8be5-2cc1-4cac-a554-ea5fae845098) from Async(default) in 1.58ms
```