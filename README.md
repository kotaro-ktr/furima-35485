# README

## usersテーブル

| column   | type   | options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| birthday | string | null: false |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

## Association
- has_many :items
- has_many :purchases

## itemsテーブル
| column      | type       | options                        |
| ----------- | ---------- | ------------------------------ |
| image       | text       | null: false                    |
| name        | string     | null: false                    |
| description | text       | null:false                     |
| category    | string     | null: false                    |
| charge      | string     | null: false                    |
| price       | string     | null: false                    |
| user_id     | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- has_one :purchase

## purchasesテーブル
| column      | type       | options                        |
| ----------- | ---------- | ------------------------------ |
| image       | text       | null: false                    |
| name        | string     | null: false                    |
| description | text       | null: false                    |
| category    | string     | null: false                    |
| charge      | string     | null: false                    |
| price       | string     | null: false                    |
| user_id     | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :item
- belongs_to :shipping

## shippingsテーブル
| column         | type   | options     |
| -------------- | ------ | ----------- |
| postal_code    | string | null: false |
| tel            | string | null: false |
| address        | string | null: false |
| municipalities | string | null: false |
| prefectures    | string | null: false |

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
