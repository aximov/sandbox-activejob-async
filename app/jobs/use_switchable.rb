class UseSwitchable < SwitchableJob
  queue_as :default

  def perform(*args)
    super
    puts 'tada!!!!!!!'
  end
end
