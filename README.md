# README

## users テーブル
| name                | string     | null:false             |
| email               | string     | null:false,unique:true |
| encrypted_password  | string     | null:false              |
| first_name          | string     | null:false             |
| last_name           | string     | null:false             |
| first_name_kana     | string     | null:false             |
| last_name_kana      | string     | null:false             |
| birth_day           | date       | null:false             |

### Association

-has_many :orders, dependent: destroy
-has_many :items, dependent: destroy

## payments テーブル

| post_code       | string     | null:false                   |
| prefecture_id   | integer    | null:false                   |
| city            | string     | null:false                   |
| block           | string     | null:false                   |
| building        | string     | ---------------------------- |
| phone_number    | string     | null:false                   |
| orders          | references | null:false,foreign_key: true |

### Association 

-belongs_to :order



## items テーブル
| name               | string        | null:false                   |
| introduction       | text          | null:false                   |
| price              | integer       | null:false                   |
| item_status_id     | integer       | null:false                   |
| shopping_cost_id   | integer       | null:false                   |
| category _id       | integer       | null:false                   |
| region_id          | integer       | null:false                    |
| shopping_date_id   | integer       | null:false                    |
| user               | references    | null:false, foreign_key: true |
 
### Association

-belongs_to :user
-has_one :order


## orders テーブル
| user      | references | null:false, foreign_key:true |
| item      | references | null:false, foreign_key:true |

### Association

-belongs_to :user
-belongs_to :item
-has_one :payment

