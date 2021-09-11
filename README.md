# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| profile            |  text  | null: false |
| affiliation        |  text  | null: false |
| post               |  text  | null: false |

### Association
has_many :prototype
has_many :comment



## comments テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| user_id      | references | null: false, foreign_key: true|
| prototype_id | references | null: false, foreign_key: true|
| text         |  text  | null: false |

### Association
belongs_to :user
belongs_to :prototype




## prototypes テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| user_id      | references | null: false, foreign_key: true|
| name         | string | null: false |
| catch_copy   |  text  | null: false |
| concept      |  text  | null: false |
| image        |  text  | null: false |

### Association
has_many :comment
belongs_to :user