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

## Debugbarを導入
[debugbar](https://debugbar.dev/docs/installation/)の手順通り導入。

## 簡易的なCRUDを作成
CMSっぽいものを実装。

## N+1問題を解消
CRUDのN+1を解消

## Redisの導入

## Rubocopの導入

## RSpecの導入

## RSpecでテストを書く

## Sidekiqの導入

## Github ActionsでCIを導入

## Reactを導入

## // TBD: Railsの機能をあれこれ使ってみる
factory bot, decorator, i18n, rails engine, validation