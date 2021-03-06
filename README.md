# テーブル設計

## users テーブル

| Column          | Type   | Options  |
| --------------- | ------ | -------- |
| nick_name       | string | null:false |
| email           | string | null:false |
| password        | string | null:false |
| first_name      | string | null:false |
| last_name       | string | null:false |
| first_name_kana | string | null:false |
| last_name_kana  | string | null:false |
| birth_date      | date   | null:false |

### Association

has_many :items
has_many :purchases

## items テーブル

| Colum        | Type       | Option            |
| ------------ | ---------- | ----------------- |
| name         | string     | null:false        |
| description  | text       | null:false        |
| category_id  | integer    | null:false        |
| condition_id | integer    | null:false        |
| burden_id    | integer    | null:false        |
| area_id      | integer    | null:false        |
| days_id      | integer    | null:false        |
| price        | integer    | null:false        |
| user         | references | foreign_key: true |

### Association

belongs_to :user
has_one :purchase


## purchases テーブル

| Colum | Type       | Options           |
| ----- | ---------- | ----------------- |
| item  | references | foreign_key: true |
| user  | references | foreign_key: true |

### Association

belongs_to :user
belongs_to :item
has_one :address


## addresses テーブル

| Colum         | Type         | Options           |
| ------------- | ------------ | ------------------|
| post_code     | string       | null:false        |
| area_id       | integer      | null:false        |
| municipality  | string       | null:false        |
| house_number  | string       | null:false        |
| building_name | string       |                   |
| phone_number  | string       | null:false        |
| purchase      | references   | foreign_key: true |


### Association

belongs_to :purchase