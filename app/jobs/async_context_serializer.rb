
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