class MyController < ApplicationController
  before_action :authenticate_user!
  set_current_tenant_through_filter # Required to opt into this behavior
  before_action :set_tenant_as_tenant

  def set_tenant_as_tenant
    tenant = Tenant.find(current_user.tenant_id)
    set_current_tenant(tenant)
  end

  def index
  end
end
