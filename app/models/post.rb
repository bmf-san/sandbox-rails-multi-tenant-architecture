class Post < ApplicationRecord
  multi_tenant :tenant

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  include ActiveRecord::Bitemporal

  validates :title, presence: true
end
