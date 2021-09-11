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
has_many :prototypes
has_many :comments



## comments テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| user_id      | string | null: false |
| prototype_id | string | null: false |
| text         |  text  | null: false |

### Association
belongs_to :users
belongs_to :prototypes




## prototypes テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| user_id      | string | null: false |
| name         | string | null: false |
| catch_copy   |  text  | null: false |
| concept      |  text  | null: false |
| image        |  text  | null: false |

### Association
has_many :comments
belongs_to :users