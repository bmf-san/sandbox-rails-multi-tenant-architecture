# sandbox-rails-multi-tenant-architecture
Ruby on Railsでマルチテナントアーキテクチャを実装し、Railsを学ぶためのサンドボックスです。

# 開発環境セットアップ
1. docker-compose up -d
2. ./bin/rails server
3. http://localhost:3000 にアクセス

# 作業記録
## 準備
1. gem install rails

## 初期プロジェクトコード生成 cf. https://github.com/bmf-san/sandbox-rails-multi-tenant-architecture/pull/1
1. rails new . --skip-bundle --skip-test --skip-turbolinks --skip-webpack-install --database=postgresql
2. bundle install

## DBセットアップ cf. https://github.com/bmf-san/sandbox-rails-multi-tenant-architecture/pull/1
1. postgresをコンテナで起動できるようにdocker-compose.ymlを作成
2. username、password、hostをconfig/database.ymlに追加
3. docker-compose up -d
4. ./bin/rails db:createでDBを作成

## Deviseの導入 cf. https://github.com/bmf-san/sandbox-rails-multi-tenant-architecture/pull/2
cf.[hearcombo/devise](https://github.com/heartcombo/devise)を導入する。

1. bundle add devise
2. rails generate devise:install
3. development.rbに以下を追加
```ruby
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```
4. rails g devise User
5. rails g devise:views
6. rails g migration add_name_to_users name:string
7. rails db:migrate

## ActiveRecordMultiTenantの導入
[active-record-multi-tenant](https://github.com/citusdata/activerecord-multi-tenant?tab=readme-ov-file)を導入。

tenantsテーブルを作成。

各テーブルにtenant_idを追加。

各modelに以下を追加。

```ruby
  multi_tenant :tenant
```

tenant事にデータを制御したいcontrollerに以下を追加。（application_controllerなどに共通処理として用意したほうが良さそう。）

```ruby
  set_current_tenant_through_filter # Required to opt into this behavior
  before_action :set_tenant_as_tenant

  def set_tenant_as_tenant
    tenant = Tenant.find(current_user.tenant_id)
    set_current_tenant(tenant)
  end
```

これで、tenant_idを都度意識してデータを参照したり、書き込む必要がなくなる。

cf. [ActiverecordMultiTenant でマルチテナンシー](https://note.com/yks0406/n/n09c181400561)

## Debugbarを導入
[debugbar](https://debugbar.dev/docs/installation/)の手順通り導入。

## 簡易的なCRUDを作成
CMSっぽいものを実装。

## N+1問題を解消
CRUDのN+1を解消

## Bitemporalの導入
```ruby
  gem 'bitemporal'
```

```ruby
  class User < ApplicationRecord
    include Bitemporal
  end
```

# Grapeの導入
```ruby
gem 'grape`
```

```ruby
# inflections.rb
ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.acronym 'API'
end
```

```ruby
# config/routes.rb
  mount API => '/'

# app/api/api.rb
class API < Grape::API
  prefix 'api'

  mount V1::Posts
end

# app/api/v1/posts.rb
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
```

## Redisの導入
Redisを導入してキャッシュストアとして使う。

## Rubocopの導入
Rubocopを導入。

```ruby
group :development do
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end
```

```
bundle exec rubocop --auto-gen-config
```

```
bundle exec rubocop -A
// or
bundle exec rubocop --auto-correct

bundle exec rubocop

bundle exec rubocop --help
```

## RSpecの導入とテスト

## Github ActionsでCIを導入

## Sidekiqの導入

## Spring導入

## Reactを導入

## // TBD: Railsの機能をあれこれ使ってみる
factory bot, decorator, i18n, rails engine, validation