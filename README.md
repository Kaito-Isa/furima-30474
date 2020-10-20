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

## itemsテーブル

| Colum        | Type      | Option   |
| ------------ | --------- | -------- |
| item_name   | string     | NOT NULL |
| description | text       | NOT NULL |
| price       | integer    | NOT NULL |
| user        | references |          |

## purchaseテーブル

| Colum         | Type       | Options  |
| ------------- | ---------- | -------- |
| curd_number   | integer    | NOT NULL |
| expiration    | integer    | NOT NULL |
| security_code | integer    | NOT NULL |
| item          | references |          |

##　addressテーブル

| Colum         | Type         | Options  |
| ------------- | ------------ | -------- |
| post_code     | integer      | NOT NULL |
| municipality  | string       | NOT NULL |
| house_number  | string       | NOT NULL |
| building_name | string       |          |
| phone_number  | integer      | NOT NULL |
