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
| user                   | integer    | null:false, foreign_key: true |
| name                   | integer    | null:false                    |
| price                  | integer    | null:false                    |
| description            | text       | null:false                    |
| category               | integer    | null:false, foreign_key: true |
| condition              | integer    | null:false, foreign_key: true |
| shipping_cost          | integer    | null:false, foreign_key: true |
| prefecture             | integer    | null:false, foreign_key: true | 
| shipping_date          | integer    | null:false, foreign_key: true |
<br>

### Association
- belongs_to :user
- has_one :buyer
<br>
<br>

### destinationsテーブル
| Column       | Type       | Option                        |
| ------------ | ---------- | ----------------------------- |
| buyer        | integer    | null:false, foreign_key: true |
| postal_code  | string     | null:false                    |
| prefecture   | integer    | null:false, foreign_key: true |
| city         | string     | null:false                    |
| address      | string     | null:false                    |
| building     | string     |                               |
| phone_number | string     | null:false                    | 
<br>

### Association
- belongs_to :buyer
<br>
<br>

### buyersテーブル
| Column  | Type       | Option                        |
| ------- | ---------- | ----------------------------- |
| user    | integer    | null:false, foreign_key: true |
| item    | integer    | null:false, foreign_key: true |
<br>

### Association
- belongs_to :user
- belongs_to :item
- has_one :destination