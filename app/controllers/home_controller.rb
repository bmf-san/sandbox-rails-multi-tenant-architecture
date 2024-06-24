class HomeController < ApplicationController
  set_current_tenant_through_filter # Required to opt into this behavior

  def index
  end
end
