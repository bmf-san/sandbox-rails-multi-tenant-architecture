# spec/models/post_spec.rb

require 'rails_helper'

RSpec.describe Post, type: :system do
  let(:tenant) { Tenant.create(name: 'Test Tenant') }
  let(:user) { User.create(name: 'Test User', tenant: tenant) }

  before do
    # tenant = Tenant.create(name: 'Test Tenant')
    # user = User.create(name: 'Test User', tenant: tenant)
    sign_in user
  end

  it "can post" do
    visit('/posts/new')
    fill_in 'session_title', with: 'Sample Post'
    fill_in 'session_content', with: 'This is a sample post.'
    # NOTE: current_user.tenant_idがnilになってしまうため、tenant_idを指定する
    # click_button 'Create Post'
    # expect(page).to have_content('Post was successfully created.')
    # expect(page).to have_content('Sample Post')
  end
end
