## アプリ名
フリマアプリ
## 概要
フリーマーケットのアプリケーションを作成しました。<br>
トップページには出品商品が一覧表示され、ユーザー登録をすると自身も商品を出品または購入ができるようになります。自身の出品商品には編集・削除機能を実装し、他のユーザーの出品商品は、クレジットカードを用いて購入することができます。
## 本番環境
https://furima-35591.herokuapp.com/
### Basic認証
- ユーザー名: admin
- パスワード: 2222
### テスト用アカウント等
#### 購入者用
- メールアドレス: 123@abc
- パスワード: 123abc
#### 購入用カード情報
- 番号：4242424242424242
- 期限：33年3月
- セキュリティコード：123
#### 出品者用
- メールアドレス名: 1234@abcd
- パスワード: 1234abcd
## 使用技術(開発環境)
### バックエンド
Ruby, Ruby on Rails
### フロントエンド
HTML, CSS, JavaScript, Ajax  
### データベース  
MySQL, SequelPro
### インフラ
AWS  
### ソース管理  
GitHub, GitHubDesktop
### テスト
RSpec  
### エディタ  
VSCode
## DB設計
### usersテーブル
| Column             | Type   | Option                   |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null:false               |
| email              | string | null:false, unique: true |
| encrypted_password | string | null:false,              |
| last_name          | string | null:false               |
| first_name         | string | null:false               |
| last_name_kana     | string | null:false               |
| first_name_kana    | string | null:false               |
| birthday           | date   | null:false               |
### Association
- has_many :items
- has_many :buyers
### itemsテーブル
| Column                 | Type       | Option                        |
| ---------------------- | ---------- | ----------------------------- |
| user                   | references | null:false, foreign_key: true |
| name                   | string     | null:false                    |
| price                  | integer    | null:false                    |
| description            | text       | null:false                    |
| category_id            | integer    | null:false                    |
| condition_id           | integer    | null:false                    |
| shipping_cost_id       | integer    | null:false                    |
| prefecture_id          | integer    | null:false                    | 
| shipping_date_id       | integer    | null:false                    |
### Association
- belongs_to :user
- has_one :buyer
### destinationsテーブル
| Column        | Type       | Option                        |
| ------------- | ---------- | ----------------------------- |
| buyer         | references | null:false, foreign_key: true |
| postal_code   | string     | null:false                    |
| prefecture_id | integer    | null:false                    |
| city          | string     | null:false                    |
| address       | string     | null:false                    |
| building      | string     |                               |
| phone_number  | string     | null:false                    | 
### Association
- belongs_to :buyer
### buyersテーブル
| Column  | Type       | Option                        |
| ------- | ---------- | ----------------------------- |
| user    | references | null:false, foreign_key: true |
| item    | references | null:false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item
- has_one :destination