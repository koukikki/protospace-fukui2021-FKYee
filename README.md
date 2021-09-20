# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| profile            |  text  | null: false |
| affiliation        |  text  | null: false |
| position           |  text  | null: false |

### Association
- has_many :prototypes
- has_many :comments


## prototypes テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| user      | references | null: false, foreign_key: true|
| name         | string | null: false |
| catch_copy   |  text  | null: false |
| concept      |  text  | null: false |

### Association
- has_many :comments
- belongs_to :user
- has_many :assessment

## comments テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| user         | references | null: false, foreign_key: true|
| prototype    | references | null: false, foreign_key: true|
| text         |  text  |  |
| score        | integer | null: false|

### Association
- belongs_to :user
- belongs_to :prototype
- belongs_to :assessment

## assessments テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| prototype    | references | null: false, foreign_key: true|
| score        | integer | null: false |

### Association
- belongs_to :comment
- belongs_to :prototype