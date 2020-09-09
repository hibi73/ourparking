# OUR PARKING

## OUR PARKINGでできること
自宅の空いている駐車場をお持ちの方（貸し手）が、  
OUR PARKINGに駐車場の登録・掲載を行い、駐車場を利用したい方（借り手）に提供できます。  
貸し手は、駐車場が利用された料金に応じた報酬を受け取れます。  
借り手は、駐車場をオンラインで簡単に予約し、利用できます。  

## OUR PARKINGの制作背景
私の両親は年齢により車を手放したことで、自宅の駐車場は常に空いている状態です。  
空いている駐車場を有効活用できないか考えた結果、駐車場を利用したい方に提供すればいいと考えました。  
そこで、自宅の空いている駐車場を利用したい方に提供できるOUR PARKINGを制作しました。 

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :parks
- has_many :comments
- has_many :purchases

## parks テーブル

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

### Association

- belongs_to :user
- has_many :comments
- has_one :purchase

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ------     | -----------                    |
| user   | references | null: false, foreign_key: true |
| park   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :park
- has_one :car

## cars テーブル

| Column     | Type       | Options                        |
| ------     | ------     | -----------                    |
| car_type   | string     | null: false                    |
| car_number | string     | null: false                    |
| purchase   | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| park    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :park