# テーブル設計

## users テーブル

| Column          | Type   | Options  |
| --------------- | ------ | -------- |
| nick_name       | string | NOT NULL |
| email           | string | NOT NULL |
| password        | string | NOT NULL |
| first_name      | string | NOT NULL |
| last_name       | string | NOT NULL |
| first_name_kana | string | NOT NULL |
| last_name_kana  | string | NOT NULL |
| birth_date      | date   | NOT NULL |

### Association

has_many :items
has_many :purchases

## items テーブル

| Colum       | Type       | Option            |
| ----------- | ---------- | ----------------- |
| name        | string     | NOT NULL          |
| description | text       | NOT NULL          |
| category    | integer    | NOT NULL          |
| condition   | integer    | NOT NULL          |
| burden      | integer    | NOT NULL          |
| area        | integer    | NOT NULL          |
| days        | integer    | NOT NULL          |
| price       | integer    | NOT NULL          |
| user        | references | foreign_key: true |

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


##　addresses テーブル

| Colum         | Type         | Options           |
| ------------- | ------------ | ------------------|
| post_code     | integer      | NOT NULL          |
| municipality  | string       | NOT NULL          |
| house_number  | string       | NOT NULL          |
| building_name | string       |                   |
| phone_number  | integer      | NOT NULL          |
| item          | references   | foreign_key: true |
| user          | references   | foreign_key: true |

### Association

belongs_to :purchase