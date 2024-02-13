# データベース設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| first_name_kanji   | string | null: false |
| last_name_kanji    | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | integer | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| product_name       | string  | null: false |
| description        | text    | null: false |
| category           | string  | null: false |
| condition_id       | integer | null: false |
| delivery_charge_id | integer | null: false |
| shipping_area_id   | integer | null: false |
| shipping_days_id   | integer | null: false |
| price              | integer | null: false |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| postal_code        | integer    | null: false |
| prefecture_id      | integer    | null: false |
| city_id            | integer    | null: false |
| street_address     | string     | null: false |
| building_name      | string     | null: false |
| phone_number       | integer    | null: false |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
