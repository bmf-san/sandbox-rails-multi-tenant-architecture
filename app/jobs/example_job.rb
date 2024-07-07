class ExampleJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts 'Run job'
  end
end
