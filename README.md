# README

## usersテーブル

| column             | type   | options                                   |
| ------------------ | ------ | ----------------------------------------- |
| family_name        | string | null: false, with: /\A[ぁ-んァ-ヶ一-龥]/+\z |
| family_name_1      | string | null: false, with: /\A[ァ-ヶー－]+\z/      |
| first_name         | string | null: false, with: /\A[ぁ-んァ-ヶ一-龥]/+\z |
| first_name_1       | string | null: false , with:/\A[ァ-ヶー－]+\z/      |
| birthday           | date   | null: false                               |
| nickname           | string | null: false                               |
| email              | string | null: false, uniqueness: true             |
| encrypted_password | string | null: false, length: {maximum: 6}         |

## Association
- has_many :items
- has_many :purchases

## itemsテーブル
| column          | type    | options                        |
| --------------- | ------- | ------------------------------ |
| name            | string  | null: false                    |
| description     | text    | null:false                     |
| category_id     | integer | null: false                    |
| charge_id       | integer | null: false                    |
| price           | integer | null: false                    |
| user_id         | integer | null: false, foreign_key: true |
| category_id     | integer | null: false                    |
| status          | string  | null: false                    |
| prefecture_id   | integer | null: false                    |
| shipping_day_id | integer | null: false                    |

## Association
- belongs_to :user
- has_one :purchase

## purchasesテーブル
| column  | type    | options                        |
| ------- | ------- | ------------------------------ |
| item_id | integer | null: false,foreign_key: true  |
| user_id | integer | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :item
- has_one :shipping

## shippingsテーブル
| column         | type    | options                        |
| -------------- | ------- | ------------------------------ |
| postal_code    | string  | null: false                    |
| tel            | string  | null: false                    |
| address        | string  | null: false                    |
| municipalities | string  | null: false                    |
| prefecture_id  | integer | null: false                    |
| mansion        | string  |                                |
| purchase_id    | integer | null: false, foreign_key: true |

## Association
- belongs_to :purchase


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
