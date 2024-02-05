# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

学習時間管理アプリ 『Learn Log』

【仕様】
ログイン・ログアウト機能
ユーザーごとの学習時間記録
1日の総学習時間表示（可能なら図示したい）
週の総学習時間表示
月の総学習時間表示
学習ログの編集・削除機能

【使用Model】
User(id,name,password_digest)
　ユーザー管理
Time(id,begin_at,end_at,user_id)
　学習ログ管理
Target(id,target,user_id)
　週の学習時間目標