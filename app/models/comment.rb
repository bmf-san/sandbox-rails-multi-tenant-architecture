class Comment < ApplicationRecord
  multi_tenant :tenant

  belongs_to :user
  belongs_to :post

  validates :user, presence: true
end
