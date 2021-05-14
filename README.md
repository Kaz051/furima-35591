## FurimaのER図
<br>

### usersテーブル
| Column          | Type   | Option     |
| --------------- | ------ | ---------- |
| nickname        | string | null:false |
| email           | string | null:false |
| password        | string | null:false |
| last_name       | string | null:false |
| first_name      | string | null:false |
| last_name_kana  | string | null:false |
| first_name_kana | string | null:false |
| birth_year      | string | null:false |
| birth_month     | string | null:false |
| birth_date      | string | null:false |
<br>

### Association
- has_many :items
- has_one :buyer
<br>
<br>

### itemsテーブル
| Column              | Type       | Option     |
| ------------------- | ---------- | ---------- |
| user_id             | references | null:false |
| item_name           | string     | null:false |
| price               | integer    | null:false |
| description         | text       | null:false |
| category            | string     | null:false |
| condition           | string     | null:false |
| shipping_cost       | string     | null:false |
| shipping_prefecture | string     | null:false | 
| shipping_date       | string     | null:false |
<br>

### Association
- belongs_to :user
- has_one :buyer
<br>
<br>

### buyersテーブル
| Column       | Type       | Option     |
| ------------ | ---------- | ---------- |
| user_id      | references | null:false |
| item_id      | references | null:false |
| postal_code  | string     | null:false |
| prefecture   | string     | null:false |
| city         | string     | null:false |
| address      | string     | null:false |
| building     | string     |            |
| phone_number | string     | null:false | 
<br>

### Association
- belongs_to :user
- belongs_to :item
- has_many :cards
<br>
<br>

### cardsテーブル
| Column     | Type       | Option     |
| ---------- | ---------- | ---------- |
| buyer_id   | references | null:false |
| card_month | string     | null:false |
| card_year  | string     | null:false |
| card_cvc   | string     | null:false |
<br>

### Association
- belongs_to :buyer