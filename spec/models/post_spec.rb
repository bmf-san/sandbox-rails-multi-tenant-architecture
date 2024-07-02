# spec/models/post_spec.rb

require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'Test User') }
  let(:tenant) { Tenant.create(name: 'Test Tenant') }

  it "is valid with valid attributes" do
    post = Post.new(title: "Sample Post", user: user, tenant: tenant)
    expect(post).to be_valid
  end
end
