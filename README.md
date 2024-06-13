# sandbox-rails-multi-tenant-architecture
Ruby on Railsでマルチテナントアーキテクチャを実装し、Railsを学ぶためのサンドボックスです。

# 開発環境セットアップ
1. docker-compose up -d
2. ./bin/rails server
3. http://localhost:3000 にアクセス

# 作業記録
## 準備
1. gem install rails

## 初期プロジェクトコード生成
1. rails new . --skip-bundle --skip-test --skip-turbolinks --skip-webpack-install --database=postgresql
2. bundle install

## DBセットアップ
1. postgresをコンテナで起動できるようにdocker-compose.ymlを作成
2. username、password、hostをconfig/database.ymlに追加
3. docker-compose up -d
4. ./bin/rails db:createでDBを作成

## Deviseの導入
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

## ToDoアプリを作成

## Rubocopの導入

## RSpecの導入

## RSpecでテストを書く

## Sidekiqの導入

## Github ActionsでCIを導入

## // TBD: Railsの機能をあれこれ使ってみる