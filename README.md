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

## items テーブル

| Colum        | Type      | Option   |
| ------------ | --------- | -------- |
| name   | string     | NOT NULL |
| description | text       | NOT NULL |
| category    |            |          |
| condition   |            |          |
| burden      |            |          |
| area        |            |          |
| days        |            |          |
| price       | integer    | NOT NULL |
| user        | references |          |

### Association

belongs_to :users
has_one :purchases
has_one :addresses

## purchases テーブル

| Colum         | Type       | Options  |
| ------------- | ---------- | -------- |
| item          | references |          |

### Association

belongs_to :item


##　addresses テーブル

| Colum         | Type       | Options |
| ------------- | ---------- | --------|
| item          | references |         |

### Association

belongs_to :item