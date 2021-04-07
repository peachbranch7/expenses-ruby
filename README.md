## usersテーブル

| Colum              | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |

### Association
- has_many :incomes
- has_many :spendings

## incomesテーブル

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| price              | integer    | null: false                    |
| category           | integer    | null: false                    |
| date               | date       | null: false                    |
| memo               | text       |                                |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## spendingsテーブル

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| price              | string     | null: false, unique: true      |
| category_id        | integer    | null: false                    |
| date               | date       | null: false                    |
| memo               | text       |                                |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
