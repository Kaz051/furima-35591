## FurimaのER図
<br>

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
<br>

### Association
- has_many :items
- has_many :buyers
<br>
<br>

### itemsテーブル
| Column                 | Type       | Option                        |
| ---------------------- | ---------- | ----------------------------- |
| user                   | references | null:false, foreign_key: true |
| name                   | string     | null:false                    |
| price                  | integer    | null:false                    |
| description            | text       | null:false                    |
| category_id            | integer    | null:false, foreign_key: true |
| condition_id           | integer    | null:false, foreign_key: true |
| shipping_cost_id       | integer    | null:false, foreign_key: true |
| prefecture_id          | integer    | null:false, foreign_key: true | 
| shipping_date_id       | integer    | null:false, foreign_key: true |
<br>

### Association
- belongs_to :user
- has_one :buyer
<br>
<br>

### destinationsテーブル
| Column        | Type       | Option                        |
| ------------- | ---------- | ----------------------------- |
| buyer         | references | null:false, foreign_key: true |
| postal_code   | string     | null:false                    |
| prefecture_id | integer    | null:false, foreign_key: true |
| city          | string     | null:false                    |
| address       | string     | null:false                    |
| building      | string     |                               |
| phone_number  | string     | null:false                    | 
<br>

### Association
- belongs_to :buyer
<br>
<br>

### buyersテーブル
| Column  | Type       | Option                        |
| ------- | ---------- | ----------------------------- |
| user    | references | null:false, foreign_key: true |
| item    | references | null:false, foreign_key: true |
<br>

### Association
- belongs_to :user
- belongs_to :item
- has_one :destination