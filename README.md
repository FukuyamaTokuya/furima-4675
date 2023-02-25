テーブル設計

## usersテーブル

| Column             | Type    | Option                     |
| ------------------ | --------| -------------------------- |
| nickname           | string  | null: false                |
| email              | string  | null: false, unique: true  |
| encrypted_password | string  | null: false                |
| last_name_kanji    | string  | null: false                |
| first_name_kanji   | string  | null: false                |
| last_name_kana     | string  | null: false                |
| first_name_kana    | string  | null: false                |
| birthday           | data    | null: false                |


### Association
- has_many :items


## itemsテーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| shipping_fee_id    | integer    | null: false                    |
| place_id           | integer    | null: false                    |
| number_of_days_id  | integer    | null: false                    |
| price              | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :purchasers


##  purchasersテーブル
| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| user_id            | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |

### Association
belongs_to :item
has_one :adds


##  addsテーブル
| Column             | Type    | Option                         |
| ------------------ | --------| ------------------------------ |
| post_code          | string  | null: false                    |
| place_id           | string  | null: false                    |
| city               | string  | null: false                    |
| house_number_id    | string  | null: false                    |
| house_name         | string  |                                |
| phone_number       | integer | null: false                    |  

### Association
belongs_to :purchaser