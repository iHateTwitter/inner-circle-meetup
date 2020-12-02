# README

## Installation

* Requirements
  * Ruby 2.7.0
  * Rails 6.0.3
  * Postgres
  * Redis

```sh
brew install rbenv
rbenv install 2.7.0
bundle install
rails db:create # 데이터베이스 생성
rails db:migrate # 데이터베이스 마이그레이션

rails db:seed # 데이터베이스에 시드값 채우기

rails s -b 0.0.0.0
```
