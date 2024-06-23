# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

number_of_tenants = 3 # 任意の数のテナントを作成
tenants_data = []

number_of_tenants.times do
  tenant_name = Faker::Company.name
  username = Faker::Internet.username
  email = Faker::Internet.email

  tenants_data << { name: tenant_name, username: username, email: email }
end

tenants_data.each do |tenant_data|
  Tenant.create(name: tenant_data[:name])
  user = User.new(name: tenant_data[:username], email: tenant_data[:email], password: 'password')
  user.tenant = Tenant.last
  user.save!
  post = user.posts.create(title: 'title', content: 'content')
  post.comments.create(content: 'content')
  post.likes.create
end
