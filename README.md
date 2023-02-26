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
| birthday           | date    | null: false                |


### Association
has_many :items
has_many :purchases


## itemsテーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| shipping_fee_id    | integer    | null: false                    |
| place_id           | integer    | null: false                    |
| number_of_day_id   | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :purchase


##  purchasesテーブル
| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association
belongs_to :item
belongs_to :user
has_one :address


##  addressesテーブル
| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| post_code          | string     | null: false                    |
| place_id           | integer    | null: false                    |
| city               | string     | null: false                    |
| house_number       | string     | null: false                    |
| house_name         | string     |                                |
| phone_number       | string     | null: false                    |  
| purchase           | references | null: false, foreign_key: true | 

### Association
belongs_to :purchase