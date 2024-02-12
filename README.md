# データベース設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| password           | string | null: false |
| first_name_kanji   | string | null: false |
| last_name_kanji    | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birth_year         | integer | null: false |
| birth_month        | integer | null: false |
| birth_day          | integer | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| product_name       | string  | null: false |
| description        | text    | null: false |
| category           | string  | null: false |
| condition          | string  | null: false |
| delivery_charge    | string  | null: false |
| shipping_area      | string  | null: false |
| shipping_days      | string  | null: false |
| price              | integer | null: false |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
