# 概要

グラフやカレンダーを用いて収支管理ができる家計簿アプリケーションです。<br><br><br>

# DB 設計

## users テーブル

| Colum              | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |

### Association

- has_many :incomes
- has_many :spendings
  <br><br>

## incomes テーブル

| Colum    | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| price    | integer    | null: false                    |
| category | integer    | null: false                    |
| date     | date       | null: false                    |
| memo     | text       |                                |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
  <br><br>

## spendings テーブル

| Colum       | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| price       | string     | null: false, unique: true      |
| category_id | integer    | null: false                    |
| date        | date       | null: false                    |
| memo        | text       |                                |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
