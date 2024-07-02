class HomeController < ApplicationController
  set_current_tenant_through_filter # Required to opt into this behavior

  def index
    Rails.cache.write('foo', 'bar')
    @cached_value = Rails.cache.read('foo')
    Rails.logger.info("Cached value: #{@cached_value}")
  end
end
