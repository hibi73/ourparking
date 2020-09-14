# OUR PARKING

## OUR PARKINGでできること
自宅の空いている駐車場をお持ちの方が、  
OUR PARKINGに駐車場の登録・掲載を行い、駐車場を利用したい方に提供できます。     

## OUR PARKINGの制作背景
私の両親が年齢により車を手放したことで、自宅の駐車場が常に空いている状態です。  
空いている駐車場を有効活用できないか考えた結果、駐車場を利用したい方に提供すればいいと考えました。  
そこで、自宅の空いている駐車場を提供したい方・利用したい方の双方が得をするOUR PARKINGを制作しました。 

## ターゲット
- 車を手放したことで、駐車場が空いている方
- 手軽に副業を始めたい方
- 外出前に駐車場を予約したい方
- 安い駐車場を利用したい方

## URL
http://18.182.144.205/  
※ゲストログイン機能から気軽に、全機能をお試し頂けます※

## OUR PARKINGの利用方法

### 駐車場を提供したい場合
1. 無料会員登録
2. 提供したい駐車場を登録
3. 駐車場が利用された料金に応じた報酬を受け取る

### 駐車場を利用したい場合
1. 無料会員登録
2. 利用したい駐車場を予約購入
3. 予約購入した駐車場を利用

## 工夫したポイント
- 採用担当者様のログインの手間を減らす為に、ゲストログイン機能を実装しました。
- 老若男女問わず受け入れてもらう為に、シンプルなUIにしました。
- 利用しやすくする為に、ホーム画面を見るだけで利用方法がわかるようにしました。

## 使用技術
- Ruby 2.6.5
- Ruby on Rails 6.0.0
- HTML
- CSS
- JavaScript
- MYSQL 0.5.3
- GitHub
- AWS

## 実装した機能
### ・ユーザー管理機能
<img width="1440" alt="スクリーンショット 2020-09-13 19 20 36" src="https://user-images.githubusercontent.com/66819398/93015701-6f857a80-f5f6-11ea-8d3c-3ffc7f6a1b60.png">

### ・駐車場の情報を登録する機能
<img width="1440" alt="スクリーンショット 2020-09-13 20 01 57" src="https://user-images.githubusercontent.com/66819398/93016458-410a9e00-f5fc-11ea-868d-e07c40bef2c9.png">

### ・駐車場の一覧を表示する機能
<img width="1440" alt="スクリーンショット 2020-09-13 19 23 30" src="https://user-images.githubusercontent.com/66819398/93015746-e0c52d80-f5f6-11ea-8e6f-df1aef924720.png">

### ・駐車場の詳細な情報を表示する機能
<img width="1440" alt="スクリーンショット 2020-09-13 20 06 30" src="https://user-images.githubusercontent.com/66819398/93016645-c3e02880-f5fd-11ea-9cb7-bf588cb20b50.png">

### ・駐車場の詳細な情報を編集する機能
<img width="1440" alt="スクリーンショット 2020-09-13 20 15 45" src="https://user-images.githubusercontent.com/66819398/93016690-1588b300-f5fe-11ea-90aa-ad01282aecb2.png">

### ・駐車場の情報を削除する機能
<img width="1440" alt="スクリーンショット 2020-09-13 19 31 57" src="https://user-images.githubusercontent.com/66819398/93015885-09015c00-f5f8-11ea-92dd-364b477d605d.png">

### ・駐車場を予約購入する機能
<img width="1440" alt="スクリーンショット 2020-09-13 20 18 23" src="https://user-images.githubusercontent.com/66819398/93016737-6ef0e200-f5fe-11ea-8879-41a458b38019.png">

### ・駐車場を検索する機能
<img width="1440" alt="スクリーンショット 2020-09-13 19 36 05" src="https://user-images.githubusercontent.com/66819398/93015948-89c05800-f5f8-11ea-8985-7238e081579a.png">

### ・駐車場に関して質問する機能
<img width="1440" alt="スクリーンショット 2020-09-13 19 38 37" src="https://user-images.githubusercontent.com/66819398/93016005-e754a480-f5f8-11ea-87bf-f0e864135535.png">


## DB設計

### ER図
![ER図 ourparking](https://user-images.githubusercontent.com/66819398/93014967-4d88f980-f5f0-11ea-9c4a-db698d7fa533.png)

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

## 今後実装したい機能
- 駐車場の住所から地図を表示する機能
- 地名やスポット名で駐車場をカテゴリー検索する機能