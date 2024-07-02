  module V1
    class Posts < Grape::API
      prefix 'api'
      version 'v1', using: :path
      format :json

      get '/posts' do
        Post.all
      end
    end
  end
