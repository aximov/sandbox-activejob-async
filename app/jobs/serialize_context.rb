module SerializeContext
  def serialize
    super.merge('context' => { 'context-key' => 'context-value' })
  end

  def deserialize(arguments)
    super
    @context_out = arguments['context']
  end
end
