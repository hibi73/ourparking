




## テーブル設計

### users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

#### Association

- has_many :parks
- has_many :comments
- has_many :purchases

### parks テーブル

| Column        | Type       | Options                        |
| ------        | ------     | -----------                    |
| name          | string     | null: false                    |
| description   | text       | null: false                    |
| postal_code   | string     | null: false                    |
| prefecture    | string     | null: false                    |
| municipality  | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| park_length   | string     | null: false                    |
| park_width    | string     | null: false                    |
| park_height   | string     | null: false                    |
| price         | integer    | null: false                    |
| use_date      | date       | null: false                    |
| user          | references | null: false, foreign_key: true |

#### Association

- belongs_to :user
- has_many :comments
- has_one :purchase

### purchases テーブル

| Column | Type       | Options                        |
| ------ | ------     | -----------                    |
| user   | references | null: false, foreign_key: true |
| park   | references | null: false, foreign_key: true |

#### Association

- belongs_to :user
- belongs_to :park
- has_one :car

### cars テーブル

| Column     | Type       | Options                        |
| ------     | ------     | -----------                    |
| car_type   | string     | null: false                    |
| car_number | string     | null: false                    |
| purchase   | references | null: false, foreign_key: true |

#### Association

- belongs_to :purchase

### comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| park    | references | null: false, foreign_key: true |

#### Association

- belongs_to :user
- belongs_to :park