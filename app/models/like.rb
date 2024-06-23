class Like < ApplicationRecord
  multi_tenant :tenant

  belongs_to :user
  belongs_to :post
end
