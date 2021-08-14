# README

## usersテーブル

| column             | type   | options                   |
| ------------------ | ------ | ------------------------- |
| family_name        | string | null: false               |
| family_name_1      | string | null: false               |
| first_name         | string | null: false               |
| first_name_1       | string | null: false               |
| birthday           | date   | null: false               |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

## Association
- has_many :items
- has_many :purchases

## itemsテーブル
| column          | type       | options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| description     | text       | null:false                     |
| charge_id       | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |
| category_id     | integer    | null: false                    |
| status_id       | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| shipping_day_id | integer    | null: false                    |

## Association
- belongs_to :user
- has_one :purchase

## ordersテーブル
| column | type       | options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false,foreign_key: true  |
| user   | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :item
- has_one :shipping

## shippingsテーブル
| column         | type       | options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| tel            | string     | null: false                    |
| address        | string     | null: false                    |
| municipalities | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| mansion        | string     |                                |
| order          | references | null: false, foreign_key: true |

## Association
- belongs_to :order


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

